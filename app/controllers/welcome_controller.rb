class WelcomeController < ApplicationController

  def index
    if current_user
      if current_user.needs_role?
        redirect_to controller: :wizard, action: :index
      elsif current_user.developer?
        redirect_to developer_path
      elsif current_user.organisation?
        redirect_to organisation_path
      end
    end
  end

end
