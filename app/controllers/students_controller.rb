class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  #after_action :student_subject, only: [:create]

  # GET /teachers
  # GET /teachers.json
  def index
     @students= Student.all
     #@subjects = Student.all
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
  end
  #
  # # GET /teachers/new
  def new
    @student = Student.new
    @subjects = Subject.all
  end
  #
  # # GET /teachers/1/edit
  def edit
    @subjects = Subject.all
  end
  #
  # # POST /teachers
  # # POST /teachers.json
  def create
    @params = params
    @student = Student.new(student_params)
    respond_to do |format|
      if @student.save
        #Student.subject(@student)
        format.html { redirect_to action: "index" }
        format.json { render :index }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end
  #
  # # PATCH/PUT /teachers/1
  # # PATCH/PUT /teachers/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to action: "index" }
        format.json { render :index }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end
  #
  # # DELETE /teachers/1
  # # DELETE /teachers/1.json
  # def destroy
  #   @teacher.destroy
  #   respond_to do |format|
  #     format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end
  #
  private
  # def student_subject
  #   h = {}
  #   @params["id"].zip(@params["mark"]) { |a,b| h[a.to_sym] = b }
  #   h.each do |k,v|
  #     Subjectstudent.create(student_id: @student.id, subject_id: k, marks: v)
  #   end
  # end
  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def student_params
    params.require(:student).permit(:name, :standard, :rank, sub_id: [], mark: [])
  end
end
