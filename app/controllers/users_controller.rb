class UsersController < ApplicationController
  def transaction
    begin
      user = User.find(transaction_params[:user_id])
      if user && user.active?
        transaction = user.transactions.create(transaction_params.except(:user_id))
        if transaction.valid?
          render json: { status: 200, message: { transaction: transaction.as_json(except: [:created_at, :updated_at]) } }
        else
          transaction.update(amount: 0, status: 'error')
          render json: { status: 422, message: { transaction: transaction.as_json(except: [:created_at, :updated_at]) } }, status: 422
        end
      else
        render_not_found_json
      end
    rescue
      render_not_found_json
    end
  end

  private

  def transaction_params
    params.permit(:user_id, :amount)
  end

  def render_not_found_json
    render json: { status: 404, message: "No such user found or it's inactive" }, status: 404
  end
end
