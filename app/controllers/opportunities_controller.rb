class OpportunitiesController < ApplicationController

  before_filter do
    redirect_to :root unless current_user.organisation?
  end

  def index
  end

  def new
    @opportunity = Opportunity.new
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
    flash[:notice] = t(".liked_html", {title: @opportunity.title})
    redirect_to :root
  end

private
  def organisation
    current_user.role_organisation
  end

end
