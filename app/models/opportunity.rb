class Opportunity < ActiveRecord::Base

  attr_accessible :title, :teaser, :start_date, :end_date, :skills

  validates :title, length: { maximum: 255 }

  validates_presence_of :title, :teaser, :start_date, :skills
  validate :ensure_end_date_is_valid

  belongs_to :organisation

  has_many :reactions

  before_save do
    self.skills = Skill.to_array_downcase(self.skills).join(",")
  end

  after_save do
    Developer.all.each do |role|
      role.judge_opportunity(self)
    end
  end

  # meaning
  # IF it is set, it should be AFTER start_date
  def ensure_end_date_is_valid
    return true if end_date.blank?
    unless start_date.blank?
      return true if end_date > start_date
    end

    errors.add(:end_date, :invalid)
  end

  def self.starting_since(start_date)
    where("start_date >= :start_date", start_date: start_date)
  end

  def self.ordered_by_start_date
    order(:start_date)
  end

  def self.available
    where("closed_at is null")
  end

  def self.closed
    where("closed_at is not null")
  end

  def reacted_by(role)
    return false unless role
    selected = role.reactions.select do |reaction|
      reaction.opportunity_id == self.id
    end
    !selected.blank?
  end

  def liked_by(role)
    return false unless role
    selected = role.reactions.select do |reaction|
      reaction.opportunity_id == self.id && reaction.score >= 0
    end
    !selected.blank?
  end

  def disliked_by(role)
    return false unless role
    selected = role.reactions.select do |reaction|
      reaction.opportunity_id == self.id && reaction.score < 0
    end
    !selected.blank?
  end

  def likes
    self.reactions.where("score >= 0")
  end

  def dislikes
    self.reactions.where("score < 0")
  end

  def close!
    raise "already closed at #{self.closed_at}" if !self.closed_at.blank?
    self.update_attribute(:closed_at, DateTime.now)
    true
  end

end
