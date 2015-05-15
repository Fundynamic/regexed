class OpportunitiesController < ApplicationController

  def index

  end

  def new
    redirect_to :root if current_user.developer?
    @opportunity = Opportunity.new
  end

  def create
    @opportunity = organisation.opportunities.build(params[:opportunity])
    if @opportunity.save
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

    like = @opportunity.likes.build
    like.role_id = role.id
    like.save!
    flash[:notice] = t(".liked")
    redirect_to :root
  end

private
  def organisation
    current_user.role_organisation
  end

end
