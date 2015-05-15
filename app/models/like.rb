class Like < ActiveRecord::Base
  belongs_to :opportunity
  belongs_to :role

  validates_presence_of :role, :opportunity
end
