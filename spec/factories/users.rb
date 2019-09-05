# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Carmen Reynolds' }
    description { 'Velit molestias vel numquam.' }
    email { 'clayton@gradykiehn.net' }
    status { 'active' }
    total_transaction_sum { 730 }
  end

  factory :random_user do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    email { Faker::Internet.email }
    stratus { 'active' }
    total_transaction_sum { rand(550) }
  end
end
