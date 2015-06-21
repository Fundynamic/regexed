require 'rails_helper'

describe Developer do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:skills) }
  it { should validate_presence_of(:pitch) }
  it { should validate_length_of(:pitch).is_at_most(255) }
  it { should validate_presence_of(:available) }
  it { should validate_presence_of(:contact_info) }

  context "it saves skills as downcased, stripped vars" do
    let(:developer) { build(:developer, skills: "Java, Ruby, Javascript") }
    before do
      developer.save
    end
    subject { developer.skills }

    it { should eq "java,ruby,javascript" }
  end

  context ".score_opportunity" do
    let(:developer) { build(:developer, skills: skills, available: Date.today) }
    let(:opportunity) { build(:opportunity, start_date: start_date, end_date: end_date) }
    let(:opportunity_score) { build(:opportunity_score, opportunity: opportunity, role: developer) }

    subject { developer.score_opportunity(opportunity_score).score }

    context "given a developer with no skills" do
      let(:skills) { "" }

      context "given an opportunity that starts today" do
        let(:start_date) { Date.today }
        let(:end_date) { nil }

        it { should eq (50) }
      end

      context "given an opportunity that starts 10 days after available date" do
        let(:start_date) { 10.days.from_now }
        let(:end_date) { nil }

        it { should eq (40) }
      end
    end
  end

end
