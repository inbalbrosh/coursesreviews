require 'ostruct'

class CoursesController < ApplicationController
  # before_action :set_course, only: %i[show edit update destroy]

  DEFAULT_SORT = 'title'
  DEFAULT_BY = 'asc'

  def serach; end

  def results
    unless current_user
      redirect_to(new_user_session_path)
      return
    end

    # TODO: if no input
    sort_params = get_sort_params(params)
    @query = params[:query]

    number_query = "number=#{@query}"
    title_query = "lower(title) LIKE lower('%#{@query}%')"

    begin
      search_query = number_query if Float(@query)
    rescue StandardError
      search_query = title_query
    end

    @courses = get_courses(sort_params.sort, sort_params.by, search_query)

    if @courses.empty?
      redirect_to(root_path, { alert: 'Sorry, no courses were found' })
      return
    end
    render({ template: 'courses/index.html.erb' })
  end

  # GET /courses or /courses.json
  def index
    sort_params = get_sort_params(params)
    get_courses(sort_params.sort, sort_params.by, nil)
  end

  # GET /courses/1 or /courses/1.json
  def show
    course_id = params[:id]
    @course = Course.where({ id: course_id }).first
    @reviews = Review.where({ course_id: @course.id }).order('created_at DESC')

    @avg_score = @reviews.empty? ? 'N/A' : (Float(@reviews.sum { |review| review['score'] }) / @reviews.size).round(2)
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  def sort
    render({ template: 'courses/index.html.erb' })
  end

  def get_sort_params(params)
    sort_params = OpenStruct.new
    sort_params.sort = params[:sort] || DEFAULT_SORT
    sort_params.by = params[:by] || DEFAULT_BY

    sort_params
  end

  def get_courses(sort, by, where)
    query = "select courses.id, title, number, instructors.first_name as instructors_first_name, instructors.last_name as instructors_last_name, syllabus, avg(score) from courses
    join reviews on courses.id = reviews.course_id
    join instructors on instructors.id = courses.instructor_id
    #{where ? "and #{where}" : ''}
    group by courses.id, courses.title, courses.number, courses.instructor_id, courses.syllabus, instructors.first_name, instructors.last_name
    union
    select courses.id, title, number, instructors.first_name as instructors_first_name, instructors.last_name as instructors_last_name, syllabus, 0 from courses
    join instructors on instructors.id = courses.instructor_id
    where courses.id not in (select course_id from reviews)
    #{where ? "and #{where}" : ''}
    order by #{sort} #{by}
    "

    @courses = ActiveRecord::Base.connection.exec_query(query).to_a
  end

  # GET /courses/1/edit
  # def edit; end

  # POST /courses or /courses.json
  # def create
  #   @course = Course.new(course_params)

  #   respond_to do |format|
  #     if @course.save
  #       format.html { redirect_to(course_url(@course), notice: 'Course was successfully created.') }
  #       format.json { render(:show, status: :created, location: @course) }
  #     else
  #       format.html { render(:new, status: :unprocessable_entity) }
  #       format.json { render(json: @course.errors, status: :unprocessable_entity) }
  #     end
  #   end
  # end

  # PATCH/PUT /courses/1 or /courses/1.json
  # def update
  #   respond_to do |format|
  #     if @course.update(course_params)
  #       format.html { redirect_to(course_url(@course), notice: 'Course was successfully updated.') }
  #       format.json { render(:show, status: :ok, location: @course) }
  #     else
  #       format.html { render(:edit, status: :unprocessable_entity) }
  #       format.json { render(json: @course.errors, status: :unprocessable_entity) }
  #     end
  #   end
  # end

  # DELETE /courses/1 or /courses/1.json
  # def destroy
  #   @course.destroy

  #   respond_to do |format|
  #     format.html { redirect_to(courses_url, notice: 'Course was successfully destroyed.') }
  #     format.json { head(:no_content) }
  #   end
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(:name)
  end
end
