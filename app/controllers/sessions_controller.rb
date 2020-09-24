class SessionsController < ApplicationController
  before_action :redirect_logged_in, only: [:new, :create]
  before_action :authorize, only: [:destroy]

  def new
  end

  def create
    user = User.find_by(username: params[:login][:username])

    if user && user.authenticate(params[:login][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Successfully logged in!'
    else
      flash.now.alert = "Incorrect email or password, try again."
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: "Logged out!"
  end
end
