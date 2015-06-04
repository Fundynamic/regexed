class Organisation < Role
  validates_presence_of :name, :pitch

  attr_accessible :name, :pitch

  has_many :opportunities
end
