class DevelopersController < ApplicationController

  def index
    if current_user
      @developer = current_user.role_developer
      # @opportunities = Opportunity.starting_since(@developer.available).ordered_by_start_date
      @opportunity_scores = OpportunityScore.for_role(@developer).ordered_by_highest_score.limit(10)
    else
      render :developers
    end
  end

  def new
    @developer = Developer.new
  end

  def edit
    @developer = Developer.find(params[:id])
  end

  def increase_likes
    @developer = Developer.find(params[:id])
    @developer.likes_budget += 10
    @developer.save!
    redirect_to :root
  end

  def update
    @developer = Developer.find(params[:id])
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
      redirect_to :root
    else
      render :new
    end
  end

end
