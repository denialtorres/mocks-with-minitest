FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "example_#{n}@domain.com" }
    password {'password'}
    first_name { "John" }
    last_name {"Smith"}
  end
end
