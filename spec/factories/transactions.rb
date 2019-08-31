FactoryBot.define do
  factory :transaction do
    UUID { "MyString" }
    amount { 1 }
    status { "MyString" }
  end
end
