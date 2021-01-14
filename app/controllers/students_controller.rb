class StudentsController < ApplicationController
  
  def index
    @students = Student.all
  end

  def show
    find_student
  end
  
  def new
    @student = Student.new
  end
  
  def create
    @movie = Student.new(student_params)
    if @movie.save
      redirect_to students_path
    else
      render :new
    end
  end
  
  private
    def find_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:first_name, :last_name)
    end
end
