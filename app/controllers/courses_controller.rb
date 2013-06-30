class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @enrollment = Enrollment.new(instructor: true)
    @course = Course.new(course_params)
    @course.enrollments << @enrollment
    current_user.enrollments << @enrollment

    respond_to do |format|
      if @enrollment.save and @course.save and current_user.save
        format.html { redirect_to root_url, notice: 'Course was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course }
      else
        format.html { render action: 'new' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end

  # GET /course/new_enrollment
  def new_enrollment
    @errors = []
  end

  # POST /course/join
  def join
    @errors = []
    @course = Course.find_by_code(params[:course_code])
    @enrollment = nil
    if @course and @course.password == params[:course_password]
      @enrollment = Enrollment.new(instructor: false)
      @course.enrollments << @enrollment
      current_user.enrollments << @enrollment
    end

    respond_to do |format|
      if @course and @enrollment and @enrollment.save and @course.save and current_user.save
        format.html { redirect_to root_url, notice: 'You have successfully joined the course.' }
      else
        @errors = ['You have either an incorrect course code or an incorrect course password.']
        format.html { render action: 'new_enrollment', locals: { errors: @errors } }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:title, :code, :password)
    end
end
