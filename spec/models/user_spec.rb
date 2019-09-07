# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create :user }
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end
  it 'is not valid without name' do
    expect(build(:user, name: nil)).to_not be_valid
  end
  it 'is not valid without email' do
    expect(build(:user, email: nil)).to_not be_valid
  end
  it 'has a total of transactions sum attribute' do
    transactions = []
    nr_of = rand(3..10)
    nr_of.times do
      transactions << user.transactions.create(amount: rand(1234)).amount
    end
    expect(user.total_transaction_sum).to eq(transactions.sum)
  end
  it 'imports new users from CSV file' do
    file = Rails.root.join('lib', 'assets', 'users.csv')
    User.import_new_users(file)
    User.get_users_rows(file) do |_row|
      expect(User.find_by(_row)).to have_attributes(_row)
    end
  end
end
