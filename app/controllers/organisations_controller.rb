class OrganisationsController < ApplicationController

  def index
    raise "this will not be called anymore"
  end

  def show
    if current_user && current_user.role_organisation.present?
      @organisation = current_user.role_organisation
      @opportunities = @organisation.opportunities
      render :index
    else
      redirect_to aanmelden_path
    end
  end

  def new
    @organisation = Organisation.new
  end

  def edit
    @organisation = current_user.role_organisation
  end

  def opportunities_with_interest
    @organisation = current_user.role_organisation
    @opportunities = @organisation.opportunities.select do |opportunity|
      opportunity.likes.count > 0
    end
  end

  def create
    @organisation = Organisation.new(params[:organisation])
    current_user.roles << @organisation
    if @organisation.save
      flash[:notice] = t(".success")
      redirect_to action: "show"
    else
      render :new
    end
  end

  def update
    @organisation = current_user.role_organisation
    if @organisation.update_attributes(params[:organisation])
      flash[:notice] = t(".success")
      redirect_to action: "show"
    else
      render :edit
    end
  end

end
