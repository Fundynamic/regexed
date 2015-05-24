class OrganisationsController < ApplicationController

  def index
    if current_user
      @organisation = current_user.role_organisation
    else
      render :organisaties
    end
  end

  def new
    @organisation = Organisation.new
  end

  def edit
    @organisation = Organisation.find(params[:id])
  end

  def create
    @organisation = Organisation.new(params[:organisation])
    current_user.roles << @organisation
    if @organisation.save
      flash[:notice] = t(".success")
      redirect_to action: "index"
    else
      render :new
    end
  end
end
