class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :name
      t.string :skills # temp string
      t.string :pitch
      t.timestamps
    end
  end
end
