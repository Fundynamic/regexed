class Developer < Role
  validates_presence_of :first_name, :last_name, :skills, :available

  attr_accessible :first_name, :last_name, :skills, :available
end
