FactoryBot.define do
  factory :merchant do
    name { 'MyString' }
    description { 'MyText' }
    email { 'MyString' }
    status { 'MyString' }
    total_transaction_sum { 1 }
  end
end
