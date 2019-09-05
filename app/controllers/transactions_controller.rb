# frozen_string_literal: true

class TransactionsController < ApplicationController
  def show
    user = User.find(t_params[:id])
    @user_transactions = user.transactions
  end
end

private

def t_params
  params.permit(:id)
end
