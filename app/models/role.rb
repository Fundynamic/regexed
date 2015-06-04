# A user can be Admin and Developer at the same time.
class Role < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :opportunity_score_for_roles

  after_save do
    Role.judge_all_opportunities(self)
  end

  def can_like?
    # likes_budget > 0
    true
  end

  def like!(opportunity)
    raise "cannot like empty opportunity" if opportunity.blank?
    return false unless self.can_like?
    like = opportunity.likes.build
    like.role_id = self.id
    like.save!
    self.update_attribute(:likes_budget, (self.likes_budget - 1))
    true
  end

  def judge_opportunity(opportunity)
    opportunity_score = OpportunityScore.find_or_create_by(role: self, opportunity: opportunity)
    old_score = opportunity_score.score
    opportunity_score.role = self
    opportunity_score.opportunity = opportunity
    opportunity_score.score = 0
    score_opportunity(opportunity_score)
    puts "#{self.name} judged opportunity #{opportunity.title} with score #{opportunity_score.score} - (was #{old_score})"
    opportunity_score.save!
  end

  def self.judge_all_opportunities(role)
    Opportunity.starting_since(role.available).each do |opportunity|
      role.judge_opportunity(opportunity)
    end
  end

end
