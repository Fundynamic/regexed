require 'rails_helper'

describe Developer do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:skills) }
  it { should validate_presence_of(:pitch) }
  it { should validate_presence_of(:available) }
  it { should validate_presence_of(:area) }

  context "can_like?" do
    let(:developer) { build(:developer, likes_budget: likes_budget) }
    subject { developer.can_like? }

    context "with 0 likes_budget" do
      let(:likes_budget) { 0 }
      it { should eq false }
    end

    context "with > 0 likes_budget" do
      let(:likes_budget) { 1 }
      it { should eq true }
    end
  end

end
