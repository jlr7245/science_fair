class SitesController < ApplicationController

  # student
  def new
    @site = Site.new(project_id: params[:project_id])
    @project = Project.find(params[:project_id])
  end

  # student
  def create
    @site = Site.new(site_params)
    @project = Project.find(params[:project_id])
    @site.project = @project
    @site.student = current_user
    if @site.save!
      redirect_to project_site_path(@project, @site)
    else
      flash[:alert] = "Whoops! Couldn't create the site. Try again!"
      redirect_to new_project_site_path
    end
  end

  # student
  def show
    @site = Site.find(params[:id])
  end

  # any
  def show_tour
    @tour = Tour.find(params[:tour_id])
    @site = Site.find(params[:id])
    @visit_helper = VisitSiteHelper.new(visitor: current_user, tour: @tour)
  end

  # instructor
  def index
  end

  def site_params
    params.require(:site).permit(:title, :description, :url, :intro, :github)
  end
end
