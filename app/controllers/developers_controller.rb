class DevelopersController < ApplicationController

  def index
    @developer = current_user.role_developer
  end

  def new
    @developer = Developer.new
  end

  def edit
    @developer = Developer.find(params[:id])
  end

  def update
    @developer = Developer.find(params[:id])
    if @developer.update_attributes(params[:developer])
      flash[:notice] = t(".success")
      render :index
    else
      render :edit
    end
  end

  def create
    @developer = Developer.new(params[:developer])
    current_user.roles << @developer
    if @developer.save
      flash[:notice] = t(".success")
      render :index
    else
      render :new
    end
  end
end
