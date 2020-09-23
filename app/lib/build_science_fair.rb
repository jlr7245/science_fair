class BuildScienceFair
  attr_reader :cohort, :students, :name, :date, :type

  def initialize(cohort, params)
    params = params.with_indifferent_access

    @cohort = cohort
    @students = cohort.students
    @date = params[:date]
    @name = params[:name]
    @type = params[:type]
  end

  def build!
    confirm_that_each_student_has_a_site!

    build_tour!

    # sites.each do |site|

    # end

    # students.each do |student|

    # end
  end

  def build_tour!
    tour = cohort.tours.create(tour_params)
    tour.update(participants: students)
    tour
  end

  def tour_params
    {
      name: name,
      date: date,
      type: type,
      cohort: cohort
    }
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
