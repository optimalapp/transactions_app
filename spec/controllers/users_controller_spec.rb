# frozen_string_literal: true

require 'pry'
require 'rails_helper'

RSpec.describe UsersController, type: :request, format: :json do
  let(:user) { FactoryBot.create :user }
  let(:amount) { 1540 }
  it 'makes transaction via JSON' do
    post user_transaction_path(user.id), params: { amount: amount }
    user.reload
    expect(response.body).to include(user.total_transaction_sum.to_s)
  end
  it 'makes transaction via XML' do
    post user_transaction_path(user.id), params: "<amount>#{amount}</amount>"
    user.reload
    expect(response.body).to include(user.total_transaction_sum.to_s)
  end
  it 'returns an error if transaction amount is 0' do
    amount = 0
    post user_transaction_path(user.id), params: { amount: amount }
    expect(response.body).to include('error')
  end
  it 'returns an error if transaction amount is not valid' do
    amount = 'qwerty'
    post user_transaction_path(user.id), params: { amount: amount }
    expect(response.body).to include('error')
  end
end
