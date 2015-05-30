require 'rails_helper'

describe Opportunity do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:teaser) }
  it { should validate_presence_of(:start_date) }
  it { should belong_to(:organisation) }

  context "opportunity with only start date" do
    let(:opportunity) { Opportunity.new({title: "foo", teaser: "some teaser", start_date: Date.today, end_date: end_date}) }
    subject { opportunity }

    context "without end_date" do
      let(:end_date) { nil }
      it { should be_valid }
    end

    context "with end_date after start date " do
      let(:end_date) { Date.tomorrow }
      it { should be_valid }
    end

    context "with end_date at start date " do
      let(:end_date) { Date.today }
      it { should_not be_valid }
    end

    context "with end_date before start date " do
      let(:end_date) { Date.yesterday }
      it { should_not be_valid }
    end
  end

  context ".liked_by" do
    let(:opportunity) { create(:opportunity) }
    subject { opportunity.liked_by(role) }

    context "with role which does not like this opportunity" do
      let(:role) { create(:role) }
      it { should eq false }
    end

    context "with role which likes this opportunity" do
      let(:role) { create(:role) }
      before do
        opportunity.likes << create(:like, role: role, opportunity: opportunity)
      end
      it { should eq true }
    end

    context "without role" do
      let(:role) { nil }
      it { should eq false }
    end
  end

  context ".starting_since" do
    let(:opportunity) { create(:opportunity) }
    before { opportunity }
    it "is found since yesterday" do
      expect(Opportunity.starting_since(Date.yesterday)).to contain_exactly(opportunity)
    end
  end

end
