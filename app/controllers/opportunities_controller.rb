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

private
  def organisation
    current_user.role_organisation
  end

end
