class Opportunity < ActiveRecord::Base

  attr_accessible :title, :teaser, :start_date, :end_date, :skills

  validates_presence_of :title, :teaser, :start_date, :skills
  validate :ensure_end_date_is_valid

  belongs_to :organisation

  has_many :likes

  before_save do
    self.skills = self.skills.split(',').map(&:strip).map(&:downcase).join(",")
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

  def liked_by(role)
    selected = likes.select do |like|
      like.role_id == role.id
    end
    !selected.blank?
  end

end
