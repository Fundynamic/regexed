class Developer < Role
  validates_presence_of :first_name, :last_name, :skills, :available, :pitch, :area

  attr_accessible :first_name, :last_name, :skills, :available, :pitch, :area

  before_save do
    self.skills = self.skills.split(',').map(&:strip).map(&:downcase).join(",")
  end

  def name
    first_name + " " + last_name
  end
end
