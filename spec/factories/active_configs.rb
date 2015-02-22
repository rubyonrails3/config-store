FactoryGirl.define do
  factory :active_config do
    key 'email'
    sequence(:value) { |n| "user#{n}@example.com" }
    type 'String'
  end
end
