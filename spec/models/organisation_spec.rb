require 'rails_helper'

describe Organisation do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:pitch) }
  it { should have_many(:opportunities) }
end
