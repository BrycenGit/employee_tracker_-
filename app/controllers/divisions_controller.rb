class DivisionsController < ApplicationController

  def index
    @divisions = Division.all
    render :index
  end

  def new
    @division = Division.new
    render :new
  end

  def create
    @division = Division.new(division_params)
    if @division.save
      flash[:notice] = "Division successfully added!"
      redirect_to divisions_path
    else
      render :new
    end
  end

  def edit
    @division = Division.find(params[:id])
    render :edit
  end

  def show
    @division = Division.find(params[:id])
    render :show
  end

  def update
    @division= Division.find(params[:id])
    if @division.update(division_params)
      flash[:notice] = "Division successfully updated!"
      redirect_to divisions_path
    else
      render :edit
    end
  end

  def destroy
    @division = Division.find(params[:id])
    @division.destroy
    flash[:notice] = "Division successfully deleted!"
    redirect_to divisions_path
  end

  private
  def division_params
    params.require(:Division).permit(:name)
  end

end