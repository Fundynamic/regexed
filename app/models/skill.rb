class Skill < ActiveRecord::Base
  validates_presence_of :name, :type
  validates_uniqueness_of :name

  def self.check_dev_skills_and_save_new_ones(skills_string)
    # the user created this one
    check_skills_and_save_new_ones(skills_string, UnknownDevSkill.to_s)
  end

  def self.check_org_skills_and_save_new_ones(skills_string)
    # the user created this one
    check_skills_and_save_new_ones(skills_string, UnknownDevSkill.to_s)
  end

  def self.check_skills_and_save_new_ones(skills_string, unknown_skill_type)
    skills_string.split(',').map(&:strip).each do |skill_name|
      skill = Skill.new
      skill.name = skill_name.downcase
      skill.type = unknown_skill_type
      if skill.valid?
        skill.save!
      end
    end
  end

end
