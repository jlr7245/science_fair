class BuildTour
  attr_reader :project, :name, :date, :students, :tour

  def initialize(args)
    args = args.with_indifferent_access

    @project = args[:project]
    @name = args[:name]
    @date = args[:date]
    @students = project.students
  end

  def build!
    confirm_that_each_student_has_a_site!
    build_tour!
    create_chatrooms!
    tour
  end

  def create_chatrooms!
    sites.each do |site|
      Chatroom.create({
        site: site,
        tour: tour
      })
    end
  end

  def build_tour!
    @tour = project.tours.create(tour_params)
  end

  def tour_params
    { name: name, date: date }
  end

  def sites
    @sites ||= students.map(&:site)
  end

  def confirm_that_each_student_has_a_site!
    problem_students = []

    students.each do |student|
      problem_students << student unless student.site
    end

    if problem_students.any?
      raise "The following students do not have a site: #{problem_students.map(&:name).join(', ')}"
    end
  end

end
