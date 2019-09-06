# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:transaction) { FactoryBot.create :transaction }
  it 'has a valid factory' do
    expect(build(:transaction)).to be_valid
  end
  it 'is not valid without amount' do
    expect(build(:transaction, amount: nil)).to_not be_valid
  end
  it 'has a generated uuid attribute' do
    expect(transaction.uuid.is_a?(String)).to eq(true)
  end
end
