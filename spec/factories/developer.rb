FactoryGirl.define do
  factory :developer do
    first_name "John"
    last_name "Doe"
    skills "java, ruby, javascript"
    available Date.today
    pitch Faker::Company.catch_phrase
    contact_info "0612345678"
  end
end
