class WizardController < ApplicationController

  def index

  end

  def developer
    @role = Developer.new
  end

  def organisation
    @role = Organisation.new
  end

end
