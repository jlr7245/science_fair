class UsersController < ApplicationController
  before_action :redirect_logged_in, only: [:create, :new]
  before_action :authorize, only: [:dashboard]

  def new
    @cohort_id = request.query_parameters[:cohort_id]
    @user = User.new(user_type: params[:user_type])
  end

  def create
    @user = User.new(user_params)

    if @user.is_student? && user_params[:cohort_id].blank?
      return redirect_to new_user_path, alert: "Must select a cohort!"
    end

    if @user.save
      if params[:user][:cohort_id]
        CohortMembership.create(cohort_id: params[:user][:cohort_id], member: @user)
      end
      session[:user_id] = @user.id
      flash[:notice] = "Account created successfully!"
      redirect_to dashboard_for_user(current_user)
    else
      redirect_to new_user_path, alert: "Oops, couldn't create account. Please double check your info."
    end
  end

  def dashboard
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :name, :user_type, :cohort_id)
  end
end
