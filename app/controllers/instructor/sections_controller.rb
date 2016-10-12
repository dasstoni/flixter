class Instructor::SectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :requre_authorized_for_current_course, only: [:new, :create]
  before_action :require_authorized_for_current_section, only: [:update]

  def new
    @section = Section.new
  end

  def create
    @section = current_course.sections.create(section_params)
    redirect_to instructor_course_path(current_course)
  end

  def update
    current_section.update_attributes(section_params)
    render text: 'updated!'
  end

  private

  def require_authorized_for_current_section
    if current_section.course.user != current_user
      render text: 'Unauthorized', status: :unauthorized
    end
  end

  helper_method :current_section
  def current_section
    @current_section ||= Section.find(params[:id])
  end

  def requre_authorized_for_current_course
    if current_course.user != current_user
      render text: 'Unauthorized', status: :unauthorized
    end
  end

  helper_method :current_course
  def current_course
    if params[:course_id]
      @current_course ||= Course.find(params[:course_id])
    else
      current_section.course
    end
  end

  def section_params
    params.require(:section).permit(:title, :row_order_position)
  end

end
