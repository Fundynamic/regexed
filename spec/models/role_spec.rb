require 'rails_helper'

describe Role do

  context "validations" do
    it { should belong_to(:user) }
  end

  context "can_like?" do
    let(:role) { build(:role, likes_budget: likes_budget) }
    subject { role.can_like? }

    context "with 0 likes_budget" do
      let(:likes_budget) { 0 }
      # it { should eq false }
      it { should eq true } # for now
    end

    context "with > 0 likes_budget" do
      let(:likes_budget) { 1 }
      it { should eq true }
    end
  end

  context "like opportunity" do
    let(:opportunity) { create(:opportunity) }
    let(:role) { create(:role, likes_budget: likes_budget) }
    subject { role.like!(opportunity) }

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
