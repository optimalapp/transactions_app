# frozen_string_literal: true

class UsersController < ApplicationController
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

  private

  def user_params
    user_params = params.require(:user).permit(:status, :name, :description, :email)
    user_params.merge(params.permit(:status))
  end
end
