FactoryGirl.define do
  factory :opportunity do
    start_date { Faker::Date.between(1.week.from_now, 6.months.from_now) }
    end_date { start_date + ((rand * 100).to_i).days }
    title Faker::Lorem.sentence
    teaser Faker::Lorem.paragraph
  end
end
