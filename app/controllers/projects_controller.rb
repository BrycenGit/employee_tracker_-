class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    render :index
  end
  
  def new
    @employee = Employee.find(params[:employee_id])
    @project = @employee.projects.new
    render :new
  end

  def create
    @employee = Employee.find(params[:employee_id])
    @project = @employee.projects.new(project_params)
    if @project.save
      @employee.projects << @project
      flash[:notice] = "Project successfully added!"
      redirect_to employee_path(@employee)
    else
      render :new
    end
  end

  def show
    @employee = Employee.find(params[:employee_id])
    @project = Project.find(params[:id])
    render :show
  end

  def edit
    @employee = Employee.find(params[:employee_id])
    @project = Project.find(params[:id])
    render :edit
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = "Project successfully updated!"
      redirect_to employee_path(@project.employee)
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "Project successfully deleted!"
    redirect_to employee_path(@project.employee)
  end
  # Other controller actions go here.

  private
    def project_params
      params.require(:project).permit(:name)
    end

end