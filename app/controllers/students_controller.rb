require "pry"
class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    set_student
    @student.active == true ? @text = "This student is currently active." : @text = "This student is currently inactive."
  end

  def activate
    set_student
    if @student.active == true
      @student.update(active: false)
    else 
      @student.update(active: true)
    end
    redirect_to student_path(@student)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end