# A user can be Admin and Developer at the same time.
class Role < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :opportunity_score_for_roles

  def can_like?
    likes_budget > 0
  end

  def like!(opportunity)
    raise "cannot like empty opportunity" if opportunity.blank?
    return false if self.likes_budget <= 0
    like = opportunity.likes.build
    like.role_id = self.id
    like.save!
    self.update_attribute(:likes_budget, (self.likes_budget - 1))
    true
  end

  def judge_opportunity(opportunity)
    # role has 'preferences'
    opportunity_score = OpportunityScore.find_or_create_by(role: self, opportunity: opportunity)
    opportunity_score.role = self
    opportunity_score.opportunity = opportunity
    opportunity_score.score = rand(100)
    opportunity_score.save!
    #
    # calculate score
    # find_or_create_by opportunity, role and set score
  end

end
