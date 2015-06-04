class OpportunityScore < ActiveRecord::Base
  belongs_to :role
  belongs_to :opportunity

  validates_presence_of :score, :role, :opportunity

  def self.for_role(role)
    where(role_id: role.id)
  end

  def self.for_opportunity(opportunity)
    where(opportunity_id: opportunity.id)
  end

  def self.ordered_by_highest_score
    order(score: :desc)
  end

  def stars
    score / 20 # we don't want half stars (yet)
  end
end
