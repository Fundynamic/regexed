class RenameLikesToReactions < ActiveRecord::Migration
  def change
    rename_table :likes, :reactions
  end
end
