class ProjectsController < ApplicationController
  # instructor
  def new
    @cohort = Cohort.find(params[:cohort_id])
    @project = Project.new(cohort: @cohort)
  end

  # instructor
  def create
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
    @projects = current_user.projects
    # this feels gnarly as all hell!!!! if i was in javascript world i would simply do a
    # nice reduce and end up with a nifty data structure but that doesn't feel rubyesque!
    # @ pete help
    @project_sites = @projects.map do |project|
      project.sites.find { |sites| sites.student == current_user }
    end
  end

  # instructor
  def cohort_projects_index
    @cohort = Cohort.find(params[:cohort_id])
    @projects = Project.where(cohort_id: params[:cohort_id])
  end

  private
  def project_params
    params.require(:project).permit(:name, :due_date)
  end
end
