require 'rails_helper'

describe OpportunityScore do
  it { should validate_presence_of :score }
  it { should validate_presence_of :role }
  it { should validate_presence_of :opportunity }

  context "created when opportunity is judged" do
    let(:opportunity) { create(:opportunity) }
    let(:developer) { create(:developer) }
    before do
      developer.judge_opportunity(opportunity)
    end

    it "should have created an opportunity score" do
      expect(OpportunityScore.count).to eq(1)
    end

    it "updates existing score" do
      developer.judge_opportunity(opportunity)
      expect(OpportunityScore.count).to eq(1)
    end

    context "creates a new one for a different role" do
      let(:other_developer) { create(:developer) }
      before do
        developer.judge_opportunity(opportunity)
        other_developer.judge_opportunity(opportunity)
      end

      it "created an opportunity score for each role" do
        expect(OpportunityScore.count).to eq(2)
      end
    end
  end

end
