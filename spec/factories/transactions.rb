# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    UUID { 'baa9fa36-953b-4adf-a48c-cece5bf60757' }
    amount { 1540 }
  end

  factory :random_transaction do
    UUID { SecureRandom.uuid }
    amount { rand(1540) }
  end
end
