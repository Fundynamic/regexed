class EndDateOpportunityIsNoLongerMandatory < ActiveRecord::Migration
  def up
    change_column :opportunities, :end_date, :datetime, null: true
  end

  def down
    change_column :opportunities, :end_date, :datetime, null: false
  end

end
