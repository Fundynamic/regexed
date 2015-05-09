# A user can be Admin and Developer at the same time.
class Role < ActiveRecord::Base

  belongs_to :user

end
