class OpportunitiesController < ApplicationController

  before_filter :check_if_organisation!, except: [:like, :dislike]
  before_filter :check_if_developer!, only: [:like, :dislike]

  def index
  end

  def new
    @opportunity = Opportunity.new
  end

  def edit
    find_opportunity_for_organisation
  end

  def update
    find_opportunity_for_organisation

    if @opportunity.update_attributes(params[:opportunity])
      Skill.check_dev_skills_and_save_new_ones(@opportunity.skills)
      flash[:notice] = t(".success")
      redirect_to :root
    else
      render :edit
    end
  end

  def find_opportunity_for_organisation
    @opportunity = Opportunity.find(params[:id])
    puts "[DENIED] Organisation #{current_user.role_organisation.name} [id #{current_user.role_organisation.id}] tried to access opportunity [#{params[:id]}] that is not theirs."
    redirect_to :root if @opportunity.organisation.id != current_user.role_organisation.id
  end

  def create
    @opportunity = organisation.opportunities.build(params[:opportunity])
    if @opportunity.save
      Skill.check_dev_skills_and_save_new_ones(@opportunity.skills)
      flash[:notice] = t(".success")
      redirect_to :root
    else
      render :new
    end
  end

  def like
    @opportunity = Opportunity.find(params[:id])
    role = if current_user.developer?
             current_user.role_developer
           elsif current_user.organisation?
             current_user.role_organisation
           else
             raise "Cannot like opportunity - invalid role"
           end
    raise "Not allowed to like" unless role.can_like?

    role.like!(@opportunity)
    flash[:notice] = t(".success", {title: @opportunity.title})
    redirect_to :root
  end

  #user has no interest
  def dislike
    @opportunity = Opportunity.find(params[:id])
    role = if current_user.developer?
             current_user.role_developer
           elsif current_user.organisation?
             current_user.role_organisation
           else
             raise "Cannot dislike opportunity - invalid role"
           end
    raise "Not allowed to dislike" unless role.can_like?

    role.dislike!(@opportunity)
    flash[:notice] = t(".success", {title: @opportunity.title})
    redirect_to :root
  end

  def destroy
    @opportunity = Opportunity.find(params[:id])
    @opportunity.close!
    flash[:notice] = t(".success", {title: @opportunity.title})
    redirect_to :root
  end

private
  def organisation
    current_user.role_organisation
  end

end
