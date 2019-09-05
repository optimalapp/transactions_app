# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:transaction) { FactoryBot.create :transaction }
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end
  it 'is not valid without name' do
    expect(build(:user, name: nil)).to_not be_valid
  end
  it 'is not valid without email' do
    expect(build(:user, email: nil)).to_not be_valid
  end
  it 'has a total transactions sum attribute' do
    total_sum = transaction.amount + transaction.user.transactions.create(amount: rand(1540)).amount
    expect(transaction.user.total_transaction_sum).to eq(total_sum)
  end
end
