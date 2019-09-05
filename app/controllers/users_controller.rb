# frozen_string_literal: true

class UsersController < ApplicationController
  include UsersDoc

  def index
    @users = User.all.order('id')
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to action: :index
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to action: :index
  end

  def transaction
    xml_params = xml_params_hash
    t_params = if xml_params.any?
                 transaction_params.merge!(xml_params)
               else
                 transaction_params
               end
    user = User.find(t_params[:user_id])
    if user&.active?
      transaction = user.transactions.create(t_params.except(:user_id))
      if transaction.valid?
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

  private

  def transaction_params
    params.permit(:user_id, :amount)
  end

  def user_params
    params.require(:user).permit(:name, :description, :email)
  end

  def render_not_found_json
    render json: { status: 404, message: "No such user found or it's inactive" }, status: 404
  end

  def xml_params_hash
    xml_string = request.body.read
    begin
      xml_params = helpers.xml_to_hash(xml_string)
    rescue StandardError
      xml_params ||= {}
    end
  end
end
