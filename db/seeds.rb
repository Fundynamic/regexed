# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Developer.find_or_create_by(
#   {
#     type: 'developer',
#     name: 'Stefan Hendriks'
#   }
# )
# ['admin', 'developer', 'organisation'].each do |role|
#   Role.find_or_create_by({type: role})
# end

DEFAULT_PASSWORD = "welkom123"

RANDOM_OPPORTUNITY_TITLES = [
  'Uitdagende java klus!',
  'Ruby rockstar gezocht!',
  'Frontender met gevoel voor design',
  'Haastklus, actie site!',
  'Help de wereld te verbeteren!',
  'Ambitieus project zoekt ambitieuze professional',
  'Fotograaf gezocht',
  'Administratief medewerker gezocht',
  'Boekhouder gezocht voor inkomstenbelasting',
]

def create_user(email, password)
  User.create(:email => email, :password => password, :password_confirmation => password)
end

def create_developer(args = {})
  puts "Creating developer with #{args}"
  user = create_user("stefan@fundynamic.com", DEFAULT_PASSWORD)
  developer = Developer.new(args)
  developer.user = user
  unless developer.save
    puts "Error creating developer, errors: #{developer.errors.messages}"
  end
  user.save!
  developer
end

def create_organisation(args = {})
  puts "Creating organisation with #{args}"
  user = create_user("admin@fundynamic.com", DEFAULT_PASSWORD)
  organisation = Organisation.new(args)
  organisation.user = user
  unless organisation.save
    puts "Error creating organisation, errors: #{organisation.errors.messages}"
  end
  user.save!
  organisation
end

def create_opportunity(organisation, args = {})
  puts "Creating opportunity for #{organisation.name} with #{args}"
  opportunity = organisation.opportunities.build(args)
  unless opportunity.save
    puts "Error creating opportunity, errors: #{opportunity.errors.messages}"
  end
  opportunity
end

def generate_n_opportunities_for(amount, organisation)
  amount.times do |index|
    start_date = Faker::Date.between(1.week.from_now, 6.months.from_now)
    end_date = if rand(10) < 6
                 start_date + ((rand * 100).to_i).days
               else
                 nil
               end
    opportunity = create_opportunity(organisation, {
                                     start_date: start_date,
                                     end_date: end_date,
                                     title: RANDOM_OPPORTUNITY_TITLES.sample,
                                     teaser: Faker::Lorem.paragraph
                                   })

    Developer.all.each do |developer|
      developer.judge_opportunity(opportunity)
    end
  end
end

#########################
# create developer(s)
#########################
create_developer({
                   first_name: "Stefan",
                   last_name: "Hendriks",
                   skills: "Java, Ruby, Javascript",
                   pitch: "Ik kan programmeren",
                   available: 1.month.from_now,
                   area: "Amsterdam"
                 })

#########################
# create organisation(s)
#########################
fundynamic = create_organisation({
                      name: Faker::Company.name,
                      skills: "Java, Ruby, Javascript",
                      pitch: Faker::Company.catch_phrase
                    })

##################################################
# generate opportunities for organisations
##################################################
generate_n_opportunities_for(10, fundynamic)
