class StudentBibliographiesController < ApplicationController
  def index
    @student = User.find(params[:user_id])
    @course = Course.find(params[:course_id])
  end

  def edit
    @student = User.find(params[:user_id])
    @bibliography = Bibliography.find(params[:bibliography_id])
  end

  def update
  end

  def destroy
  end
end
