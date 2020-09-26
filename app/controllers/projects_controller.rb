class ProjectsController < ApplicationController
  # instructor
  def new
    @cohort = Cohort.find(params[:cohort_id])
    @project = Project.new(cohort: @cohort)
  end

  # instructor
  def create
    p "here's the create method"
    @cohort = Cohort.find(params[:cohort_id])
    @project = Project.new(project_params)
    @project.cohort = @cohort
    if @project.save
      redirect_to cohort_project_path(@cohort, @project)
    else
      flash[:alert] = "Couldn't create project! Please try again"
      render "new"
    end
  end

  # instructor
  def show
    @project = Project.find(params[:id])
  end

  # student
  def index
  end

  private
  def project_params
    params.require(:project).permit(:name, :due_date)
  end
end
