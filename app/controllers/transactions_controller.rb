# frozen_string_literal: true

class TransactionsController < ApplicationController
  include TransactionsDoc

  def create
    xml_params = xml_params_hash
    t_params = if xml_params.any?
                 transaction_params.merge!(xml_params)
               else
                 transaction_params
               end
    user = User.find(t_params[:user_id])
    if user&.active?
      transaction = user.transactions.create(t_params.except(:user_id))
      if transaction.valid? && t_params[:amount] != '0'
        render json: { status: 200, message: { transaction: transaction.as_json(except: %i[created_at updated_at]) } }
      else
        transaction.update(amount: 0, status: 'error')
        render json: { status: 422, message: { transaction: transaction.as_json(except: %i[created_at updated_at]) } }, status: 422
      end
    else
      render_not_found_json
    end
  rescue StandardError
    render_not_found_json
  end

  def show
    user = User.find(t_params[:id])
    @user_transactions = user.transactions
  end
end

private

def t_params
  params.permit(:id)
end

def transaction_params
  params.permit(:user_id, :amount)
end

def render_not_found_json
  render json: { status: 404, message: "No such user found or it's inactive" }, status: 404
end

def xml_params_hash
  xml_string = request.body.read
  begin
    helpers.xml_to_hash(xml_string)
  rescue StandardError
    {}
  end
end
