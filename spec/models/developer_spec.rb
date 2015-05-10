require 'rails_helper'

describe Developer do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:skills) }
  it { should validate_presence_of(:availability) }
end
