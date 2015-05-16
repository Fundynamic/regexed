FactoryGirl.define do
  factory :developer do
    first_name "John"
    last_name "Doe"
    skills "java, ruby, javascript"
    available Date.today
    pitch Faker::Company.catch_phrase
    area Faker::Address.city
  end
end
