class ToursController < ApplicationController
  def create
    project = Project.find(params[:project_id])
    cohort = project.cohort
    tour = BuildTour.new(project: project, name: "Cohort #{cohort.name}: #{project.name}", date: Date.today)
    if @tour = tour.build!
      redirect_to "/tours/#{@tour.id}/random_site"
    else
      flash[:alert] = "Tour could not be built! Please try again"
    end
  end

  def random_site
    tour = Tour.find(params[:tour_id])
    visit_helper = VisitSiteHelper.new(visitor: current_user, tour: tour)
    redirect_to tour_site_with_chat_path(tour, visit_helper.visit_next_site!)
  end
end
