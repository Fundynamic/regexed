class Organisation < Role
  attr_accessor :name

  validates_presence_of :name
end
