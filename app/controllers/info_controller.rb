class InfoController < ApplicationController
  def developers
  end

  def organisations
  end

  def contact
  end

  def manifesto
  end

  def algemenevoorwaarden
  end

  def stats
    @total_count_developers = Developer.all.count
    @total_count_organisations = Organisation.all.count
    @total_count_opportunities = Opportunity.all.count
    @total_count_reactions = Reaction.all.count
  end

  def prijzen
  end

end
