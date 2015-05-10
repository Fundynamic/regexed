class Developer < Role
  attr_accessor :first_name, :last_name, :skills, :availability

  validates_presence_of :first_name, :last_name, :skills, :availability

  attr_accessible :first_name, :last_name, :skills, :availability
end
