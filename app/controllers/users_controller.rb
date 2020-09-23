class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Account created successfully!"
      redirect_to root_path
    else
      flash.now.alert = "Oops, couldn't create account. Please double check your info."
      redirect_to '/users/new'
    end
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :name, :user_type)
  end
end
