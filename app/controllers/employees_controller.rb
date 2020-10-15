class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
    render :index
  end
  
  def new
    if params[:division_id]
      @division = Division.find(params[:division_id])
      @employee = @division.employees.new
      render :new
    else
      @employee = Employee.new
      render :new
    end
  end

  def create
    if params[:division_id]
      @division = Division.find(params[:division_id])
      @employee = @division.employees.new(employee_params)
      if @employee.save
        flash[:notice] = "Employee successfully added!"
        redirect_to division_path(@division)
      else
        render :new
      end
    else
      @employee = Employee.new(employee_params)
      if @employee.save
        flash[:notice] = "Employee successfully added!"
        redirect_to employees_path
      else
        render :new
      end
    end
  end

  def show
    if params[:division_id]
      @division = Division.find(params[:division_id])
      @employee = Employee.find(params[:id])
      render :show
    else
      @employee = Employee.find(params[:id])
      render :show
    end
  end

  def edit
    if params[:division_id]
      @division = Division.find(params[:division_id])
      @employee = Employee.find(params[:id])
      render :edit
    else
      @employee = Employee.find(params[:id])
      render :edit
    end
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      flash[:notice] = "Employee successfully updated!"
      if @employee.division != nil
        redirect_to division_path(@employee.division)
      else
        redirect_to employee_path
      end
    else
      render :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    flash[:notice] = "Employee successfully deleted!"
    if @employee.division != nil
      redirect_to division_path(@employee.division)
    else
      redirect_to employees_path
    end
  end
  # Other controller actions go here.

  private
    def employee_params
      params.require(:employee).permit(:name)
    end

end