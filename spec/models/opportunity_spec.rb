require 'rails_helper'

describe Opportunity do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:teaser) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }
end
