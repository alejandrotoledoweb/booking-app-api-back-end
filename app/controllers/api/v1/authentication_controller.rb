class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authorized, only: [:create]
  
  def create
    @user = User.find_by(username: params[:username])

    check_auth = @user.authenticate(params[:password])
    if @user && check_auth
      token = encode_token({ user_id: @user.id })
      render json: { user: trim_user(@user), token: token, logged_in: true }, status: :ok
    else
      render json: { error: 'Invalid username or password', status: 'NOT_LOGGED_IN' }
    end
  end

  def destroy
    reset_session
    render json: { logged_out: true }, status: :ok
  end
  

  private

  def user_params
    params.permit(:name, :username, :email, :password, :password_confirmation)
  end

  def trim_user(user)
    { id: user.id, name: user.name, username: user.username, email: user.email }
  end
end
