class Api::V1::UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    if @user.save
      render json: UserRepresenter.new(@user).as_json, status: :ok
    else
      render json: { message: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user
      @user.destroy
      @users = User.all
      render json: @users, status: :ok
    else
      render json: { message: "can't find a user with the id #{params[:id]} " }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :username, :email, :password)
  end
end
