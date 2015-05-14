class OpportunitiesController < ApplicationController

  def index

  end

  def new
    redirect_to :root if current_user.developer?
    @opportunity = Opportunity.new
  end

  def create

  end

end
