class FreshUserConstraint
  def matches?
    current_user && current_user.roles.empty?
  end
end
