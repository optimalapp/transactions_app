# frozen_string_literal: true

require 'rails_helper'
RSpec.describe TransactionsController, type: :request, format: :json do
  let(:user) { FactoryBot.create :user }
  let(:amount) { rand(1234) }
  it 'accepts a transaction via JSON' do
    post transactions_path, params: { amount: amount, user_id: user.id }
    user.reload
    expect(response.body).to include(user.total_transaction_sum.to_s)
  end
  it 'accepts a transaction via XML' do
    post transactions_path, params: "<transaction><amount>#{amount}</amount><user_id>#{user.id}</user_id></transaction>"
    user.reload
    expect(response.body).to include(user.total_transaction_sum.to_s)
  end
  it 'saves a invalid transaction of an existing user (active)' do
    amount = 0
    post transactions_path, params: { amount: amount, user_id: user.id }
    expect(response.body).to include('error')
  end
  it 'saves a invalid transaction of an existing user (active) ' do
    amount = 'qwerty'
    post transactions_path, params: { amount: amount, user_id: user.id }
    expect(response.body).to include('error')
  end
  it 'returns a transaction error if user not exits' do
    post transactions_path, params: { amount: amount, user_id: user.id + 1 }
    expect(response.status).to eq(404)
  end
  it 'returns a transaction error if user is not valid' do
    user.update(status: 'invalid')
    post transactions_path, params: { amount: amount, user_id: user.id }
    expect(response.status).to eq(404)
  end
end
