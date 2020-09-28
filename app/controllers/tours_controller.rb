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

    if (site = visit_helper.visit_next_site!)
      redirect_to tour_site_with_chat_path(tour, site)
    else
      redirect_to dashboard_for_user(current_user), notice: "You have finished touring all sites!"
    end
  end
end
