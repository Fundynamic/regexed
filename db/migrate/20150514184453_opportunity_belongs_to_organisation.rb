class OpportunityBelongsToOrganisation < ActiveRecord::Migration
  def change
    add_column :opportunities, :organisation_id, :integer
  end
end
