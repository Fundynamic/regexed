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
    @organisation = current_user.role_organisation
  end

  def create
    @organisation = Organisation.new(params[:organisation])
    current_user.roles << @organisation
    if @organisation.save
      flash[:notice] = t(".success")
      Skill.check_org_skills_and_save_new_ones(@organisation.skills)
      redirect_to action: "index"
    else
      render :new
    end
  end
end
