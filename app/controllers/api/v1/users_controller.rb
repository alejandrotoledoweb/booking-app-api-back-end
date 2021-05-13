class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.create(user_params)
    if @user.save
      token = encode_token({ user_id: @user.id })
      render json: { user: @user.attributes, token: token, created: true }, status: :created
    else
      render json: { created: false, error_messages: @user.errors.full_messages }, status: :not_acceptable
    end
  end

  private

  def user_params
    params.permit(:name, :username, :email, :password, :password_confirmation)
  end
end
