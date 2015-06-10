class ChangeOpportunityTeaserColumnTypeToText < ActiveRecord::Migration
  def change
    change_column :opportunities, :teaser, :text
  end
end
