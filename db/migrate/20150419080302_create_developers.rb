class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.string :first_name
      t.string :last_name
      t.string :skills # voor nu (dit wordt een lijst van skills met autocomplete en dat soort dingen)
      t.date :available
      t.timestamps
    end
  end
end
