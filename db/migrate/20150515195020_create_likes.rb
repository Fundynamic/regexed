class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.timestamps
    end

    add_reference :likes, :role, index: true
    add_reference :likes, :opportunity, index: true
  end
end
