class CreateOpportunityScore < ActiveRecord::Migration
  def change
    create_table :opportunity_scores do |t|
      t.integer :score, default: 0
      t.timestamps
    end

    add_reference :opportunity_scores, :role, index: true
    add_reference :opportunity_scores, :opportunity, index: true
  end
end
