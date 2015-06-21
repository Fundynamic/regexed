class Developer < Role
  validates_presence_of :first_name, :last_name, :skills, :available, :pitch, :contact_info

  attr_accessible :first_name, :last_name, :skills, :available, :pitch, :contact_info

  validates_length_of :pitch, maximum: 255

  before_save do
    self.skills = Skill.to_array_downcase(self.skills).join(",")
  end

  def name
    first_name + " " + last_name
  end

  def score_opportunity(opportunity_score)
    # TODO: base scoring on preferences

    # the closer to the availability date the more points (50% for now)
    opportunity = opportunity_score.opportunity
    role = opportunity_score.role

    days = (opportunity.start_date.to_datetime - role.available.to_datetime).to_i
    days = 50 if days > 50
    if days < 0
      if days < -14
        days = 0
      else
        days = days.abs
      end
    end
    opportunity_score.score += (50 - days)

    # every skill that matches, scores a point
    skills_role = Skill.to_array_downcase(self.skills)
    if skills_role.size > 0
      skills_opportunity = Skill.to_array_downcase(opportunity.skills)
      points_per_skill = 50 / skills_opportunity.size
      skills_role.each do |skill|
        opportunity_score.score += points_per_skill if skills_opportunity.include?(skill)
      end
    end
    opportunity_score
  end

end
