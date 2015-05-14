class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :type # for Single Table Inheritance
      t.timestamps
    end
  end
end
