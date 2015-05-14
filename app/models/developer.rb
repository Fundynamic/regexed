class Developer < Role
  validates_presence_of :first_name, :last_name, :skills, :available, :pitch

  attr_accessible :first_name, :last_name, :skills, :available, :pitch
end
