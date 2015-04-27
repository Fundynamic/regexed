class Developer < User

  attr_accessible :name

  validates_presence_of :name

end
