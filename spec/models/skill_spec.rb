require 'rails_helper'

describe Skill do

  context "validation" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:type) }
    it { should validate_uniqueness_of(:name) }
  end

end
