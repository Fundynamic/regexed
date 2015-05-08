class Developer < Role

  attr_accessible :name

  validates_presence_of :name

end
