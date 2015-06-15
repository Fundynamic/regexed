class Reaction < ActiveRecord::Base
  belongs_to :opportunity
  belongs_to :role

  validates_presence_of :role, :opportunity

  def self.likes
    where('score > 0')
  end

  def self dislikes
    where('score < 0')
  end

end
