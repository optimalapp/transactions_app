class MerchantsController < ApplicationController
  def transaction
    merchant = Merchant.find_by(transaction_params.except(:amount, :status))
    merchant.transactions.create(transaction_params.except(:email, :name))
  end

  private

  def transaction_params
    params.permit(:email, :name, :amount, :status)
  end
end
