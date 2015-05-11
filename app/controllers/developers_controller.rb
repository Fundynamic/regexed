class DevelopersController < ApplicationController

  def index

  end

  def new
    @developer = Developer.new
  end

  def edit
    puts "id is #{params[:id]}"
    puts "dev is #{Developer.find(params[:id])}"
    @developer = Developer.find(params[:id])
  end

  def create
    puts "developer params #{params[:developer]}"
    @developer = Developer.new(params[:developer])
    puts "developer to be created #{@developer}"
    current_user.roles << @developer
    if @developer.save
      flash[:notice] = t(".success")
      redirect_to action: "index"
    else
      render :new
    end
  end
end
