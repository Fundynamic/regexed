class DevelopersController < ApplicationController

  def index
    raise "this should never be reached"
  end

  def show
    if current_user && current_user.role_developer.present?
      @developer = current_user.role_developer
      # @opportunities = Opportunity.starting_since(@developer.available).ordered_by_start_date
      @opportunity_scores = OpportunityScore.for_role(@developer).ordered_by_highest_score.limit(10)
      render :index
    else
      render :developers
    end
  end

  def new
    @developer = Developer.new
  end

  def edit
    @developer = current_user.role_developer
  end

  def increase_likes
    @developer = current_user.role_developer
    @developer.likes_budget += 10
    @developer.save!
    redirect_to :root
  end

  def update
    @developer = current_user.role_developer
    if @developer.update_attributes(params[:developer])
      Skill.check_dev_skills_and_save_new_ones(@developer.skills)
      flash[:notice] = t(".success")
      redirect_to :root
    else
      render :edit
    end
  end

  def create
    @developer = Developer.new(params[:developer])
    current_user.roles << @developer
    if @developer.save
      Skill.check_dev_skills_and_save_new_ones(@developer.skills)
      flash[:notice] = t(".success")
      render :show
    else
      render :new
    end
  end

end
