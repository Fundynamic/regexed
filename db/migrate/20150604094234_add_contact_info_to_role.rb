class AddContactInfoToRole < ActiveRecord::Migration
  def change
    add_column :roles, :contact_info, :string
  end

end
