class AddAreaLatLonToDeveloper < ActiveRecord::Migration
  def up
    add_column :roles, :area, :string

    # for storing lat/lon for area above.
    add_column :roles, :lat, :decimal, precision: 8, scale: 2, default: 0.0
    add_column :roles, :lon, :decimal, precision: 8, scale: 2, default: 0.0
  end
end
