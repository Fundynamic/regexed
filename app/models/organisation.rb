class Organisation < Role
  validates_presence_of :name, :pitch, :skills

  attr_accessible :name, :pitch, :skills
end
