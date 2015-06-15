class AddScoreToReaction < ActiveRecord::Migration
  def change
    add_column :reactions, :score, :integer, default: 0
  end
end
