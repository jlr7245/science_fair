class CohortsController < ApplicationController
  # Comment this in once auth is ironed out!
  # before_action :instructors_only!

  def new
    @cohort = Cohort.new
  end

  def index
    @cohorts = Cohort.all.includes(:creator)
  end

  def create
    @cohort = Cohort.new(cohort_params)

    if @cohort.save
      redirect_to cohorts_path
    else
      render 'new'
    end
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name, :starts_on, :ends_on).merge(creator: current_user)
  end
end
