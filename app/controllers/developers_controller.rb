class DevelopersController < ApplicationController

  def index
    @developer = current_user.role_developer
    @opportunities = Opportunity.starting_since(@developer.available).ordered_by_start_date
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
      flash[:notice] = t(".success")
      redirect_to :root
    else
      render :new
    end
  end
end
