class AddLikesBudgetToRoles < ActiveRecord::Migration
  def up
    add_column :roles, :likes_budget, :integer, default: 0
  end

  def down
    remove_column :roles, :likes_budget
  end
end
