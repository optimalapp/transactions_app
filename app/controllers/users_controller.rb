class UsersController < ApplicationController
  def transaction
    user = User.find_by(transaction_params.except(:amount, :status))
    if user && user.active?
      user.transactions.create(transaction_params.except(:email, :name))
      render json: { status: 200, message: { user: user.as_json(except: [:created_at, :updated_at]) } }
    else
      render json: { status: 404, message: "No such user found or it's inactive" }, status: 404
    end
  end

  private

  def transaction_params
    params.permit(:email, :name, :amount, :status)
  end
end
