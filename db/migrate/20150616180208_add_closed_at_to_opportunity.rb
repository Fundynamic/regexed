class AddClosedAtToOpportunity < ActiveRecord::Migration
  def change
    add_column :opportunities, :closed_at, :datetime, default: nil
  end
end
