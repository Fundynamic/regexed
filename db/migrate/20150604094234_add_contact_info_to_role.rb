class AddContactInfoToRole < ActiveRecord::Migration
  # class Developer < ActiveRecord::Base; end

  def up
    add_column :roles, :contact_info, :string
    Developer.transaction do
      Developer.all.each do |dev|
        dev.update(contact_info: dev.user.email)
      end
    end

  end

  def down
    remove_column :roles, :contact_info, :string
  end

end
