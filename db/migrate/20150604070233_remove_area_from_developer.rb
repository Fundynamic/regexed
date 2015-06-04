class RemoveAreaFromDeveloper < ActiveRecord::Migration
  def change
    remove_column :roles, :area
  end
end
