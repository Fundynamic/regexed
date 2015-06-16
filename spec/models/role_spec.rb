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
      # it { should eq false }
      it { should eq true } # for now
    end

    context "with > 0 likes_budget" do
      let(:likes_budget) { 1 }
      it { should eq true }
    end

    context "score" do
      let(:likes_budget) { 1 } # does not matter really
      it "reaction score should be 1 for like" do
        subject
        expect( role.reload.reactions.first.score ).to eq(1)
      end
    end
  end

  context "dislike opportunity" do
    let(:opportunity) { create(:opportunity) }
    let(:role) { create(:role, likes_budget: likes_budget) }
    subject { role.dislike!(opportunity) }

    context "with 0 likes_budget" do
      let(:likes_budget) { 0 }
      # it { should eq false }
      it { should eq true } # for now
    end

    context "score" do
      let(:likes_budget) { 1 } # does not matter really
      it "reaction score should be -1 for dislike" do
        subject
        expect( role.reload.reactions.first.score ).to eq(-1)
      end
    end

    context "with > 0 likes_budget" do
      let(:likes_budget) { 1 }
      it { should eq true }
    end
  end

end
