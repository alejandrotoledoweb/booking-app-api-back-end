class AuthenticationController < ApplicationController
    skip_before_action :authorize_request, only: :create
  
    def create
      @user = User.find_by_email(params[:email])
      token =
        AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
      json_response(token: token, name: @user.name, username: @user.username)
    end
  
    private
  
    def auth_params
      params.permit(:email, :password)
    end
  end
  