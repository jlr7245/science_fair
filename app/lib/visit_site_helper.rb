class VisitSiteHelper
  attr_reader :visitor, :tour

  def initialize(args)
    @visitor = args[:visitor]
    @tour = args[:tour]
  end

  def visit_next_site!
    site = sites_left_to_visit.sample

    return site if site.nil?

    TourVisit.create({
      site: site,
      tour: tour,
      user: visitor
    })

    site
  end

  def sites_left_to_visit
    (sites_in_current_tour - sites_already_visited) - [visitors_own_site]
  end

  def visitors_own_site
    visitor.site
  end

  def sites_in_current_tour
    tour.students.includes(:site).map(&:site)
  end

  def sites_already_visited
    TourVisit.for_visitor_and_tour(visitor, tour)
    .includes(:site)
    .map(&:site)
  end
end
