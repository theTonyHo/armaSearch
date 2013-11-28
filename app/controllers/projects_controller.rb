class ProjectsController < ApplicationController

  attr_reader :name
  before_filter :authenticate_user!


  # Use this to define the route so that it finds the record by Name instead of id
  # def to_param
  #   name
  # end

  def index
    @projects = Project.all()
  end

  def edit
    @project = Project.find(params[:id])
  end

  def show
    @project = Project.find(params[:id])
    params[:project_id] = params[:id]
  end


  def update
    @project = Project.find(params[:id])
    if @project.update(permitted_params)
      redirect_to project_path
    else
      render 'edit'
    end
  end

  def to_param
    "BLAH"
  end

  protected
  def permitted_params
    params.require(:project).permit(:number, :description)
  end

end
