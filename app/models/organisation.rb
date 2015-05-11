class Organisation < Role
  attr_accessor :name, :pitch, :skills

  validates_presence_of :name, :pitch, :skills

  attr_accessible :name, :pitch, :skills
end
