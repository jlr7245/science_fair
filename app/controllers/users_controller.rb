class UsersController < ApplicationController
  before_action :redirect_logged_in, only: [:create, :new]
  before_action :authorize, only: [:dashboard]
  
  def new
    @user = User.new(user_type: params[:user_type])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Account created successfully!"
      redirect_to root_path
    else
      redirect_to new_user_path, alert: "Oops, couldn't create account. Please double check your info."
    end
  end

  def dashboard
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :name, :user_type)
  end
end
