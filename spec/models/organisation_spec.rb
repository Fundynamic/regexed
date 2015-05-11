require 'rails_helper'

describe Organisation do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:skills) }
  it { should validate_presence_of(:pitch) }
end
