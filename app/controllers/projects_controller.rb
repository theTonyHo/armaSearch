class ProjectsController < ApplicationController

  before_filter :authenticate_user!


  # Use this to define the route so that it finds the record by Name instead of id
  # def to_param
  #   name
  # end

  def index
    @projects = Project.all()
  end

 def new
    @project = Project.new
  end

  def create
    @project = Project.new(permitted_params)
    
    if @project.save
      redirect_to projects_path
    else
      render 'new'
    end
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

  protected
  def permitted_params
    params.require(:project).permit(:number, :description)
  end

end
