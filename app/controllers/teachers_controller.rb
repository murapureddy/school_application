class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  after_action  :teacher_subject, only: [:update, :create]

  # GET /teachers
  # GET /teachers.json
  def index
    teacher = @current_user

    if teacher.role == 'admin'
    @teachers = Teacher.all
    else
      redirect_to :controller => 'students', :action => 'index'
    end
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @params = params
    @teacher = Teacher.new(teacher_params)
    @teacher.school_id = School.first.id

    respond_to do |format|
      if @teacher.save
        #Teacher.teacher_subject(@teacher,params["subject"])
        format.html { redirect_to action: "index" }
        format.json { render :index }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to action: "index" }
        format.json { render :index }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

  def teacher_subject
    if @params["teacher"]["subject_id"].present?
      subject = Subject.find  @params["teacher"]["subject_id"]
      subject.teacher_id = @teacher.id
      subject.save
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:firstname, :lastname, :email,  :password, :role, :school_id, subject: [])
    end
end
