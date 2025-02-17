class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :roles

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation

  def developer?
    is_role? Developer.to_s
  end

  def role_developer
    get_role Developer.to_s
  end

  def organisation?
    is_role? Organisation.to_s
  end

  def role_organisation
    get_role Organisation.to_s
  end

  def role
    roles.first
  end

  def role_name
    return "organisation" if role_organisation
    return "developer" if role_developer
    nil
  end

  def admin?
    is_role? Admin.to_s
  end

  def needs_role?
    return true if self.roles.empty?
    roles.each do |role|
      return true if role.valid? == false
    end
    return false
  end

private
  def is_role?(role_type)
    roles.each do |role|
      return true if role.type == role_type && role.valid?
    end
    false
  end

  def get_role(role_type)
    roles.each do |role|
      return role if role.type == role_type
    end
    nil
  end

end
