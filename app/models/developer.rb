class Developer < Role
  validates_presence_of :first_name, :last_name, :skills, :available, :pitch, :area

  attr_accessible :first_name, :last_name, :skills, :available, :pitch, :area

  before_save do
    self.skills = self.skills.split(',').map(&:strip).map(&:downcase).join(",")
  end

  def name
    first_name + " " + last_name
  end

  def score_opportunity(opportunity_score)
    # the closer to the availability date the more points (50% for now)
    opportunity = opportunity_score.opportunity
    role = opportunity_score.role
    days = (opportunity.start_date.to_datetime - role.available.to_datetime).to_i
    days = 50 if days > 50
    opportunity_score.score += (50 - days)

    # every skill that matches, scores a point
  end

end
