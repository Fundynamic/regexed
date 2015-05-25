# A user can be Admin and Developer at the same time.
class Role < ActiveRecord::Base

  belongs_to :user

  def can_like?
    likes_budget > 0
  end

  def like!(opportunity)
    return false if self.likes_budget <= 0
    like = opportunity.likes.build
    like.role_id = self.id
    like.save!
    self.update_attribute(:likes_budget, (self.likes_budget - 1))
    true
  end

end
