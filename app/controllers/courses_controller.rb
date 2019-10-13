class CoursesController < ApplicationController
  before_action :set_category
  before_action :set_category_course, only: [:show, :update, :destroy]

  def index
    json_response(@category.courses)
  end

  def show
    json_response(@course)
  end

  def create
    course = @category.courses.create!(course_params)
    json_response(course, :created)
  end

  def update
    @course.update(course_params)
    json_response(@course, :ok)
  end

  def destroy
    @course.destroy
    head :ok
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_category_course
    @course = @category.courses.find_by!(id: params[:id]) if @category
  end

  def course_params
    params.require(:course).permit(:name, :author, :state)
  end
end
