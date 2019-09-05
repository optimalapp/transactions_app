# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    association :user
    amount { 1540 }
  end
end
