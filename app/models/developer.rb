class Developer < Role
  # This is not STI.
  # STI ->is one table, with 'type' column, and based on that you can have different classes with different columns (in the same table).
  # So
  #
  attr_accessor :first_name, :last_name, :skills, :availability

  validates_presence_of :first_name, :last_name, :skills, :availability

  attr_accessible :first_name, :last_name, :skills, :availability
end
