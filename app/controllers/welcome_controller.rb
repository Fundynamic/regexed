class WelcomeController < ApplicationController

  def index
    if current_user
      if current_user.roles.empty?
        redirect_to controller: :wizard, action: :index
      end
    end
  end

  def developers

  end

  def companies

  end

end
