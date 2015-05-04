class Opportunity < ActiveRecord::Base

  attr_accessor :title, :teaser, :start_date, :end_date

  validates_presence_of :title, :teaser, :start_date, :end_date

end
