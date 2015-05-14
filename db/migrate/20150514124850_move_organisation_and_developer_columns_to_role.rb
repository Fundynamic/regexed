class MoveOrganisationAndDeveloperColumnsToRole < ActiveRecord::Migration
  def change
  # columns for developer
    add_column :roles, :first_name, :string
    add_column :roles, :last_name, :string
    add_column :roles, :available, :date

    # columns for organisation
    add_column :roles, :name, :string

    # columns for both
    add_column :roles, :skills, :string # voor nu (dit wordt een lijst van skills met autocomplete en dat soort dingen)
    add_column :roles, :pitch, :string


    # drop tables for developer and organisation
    drop_table :developers
    drop_table :organisations
  end
end
