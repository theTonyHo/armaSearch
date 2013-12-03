class ProjectsController < ApplicationController

  before_filter :authenticate_user!

  # Use this to define the route so that it finds the record by Name instead of id
  # def to_param
  #   name
  # end

  def index
    @projects = current_user.all_projects
  end

 def new
    @project = current_user.projects.build()
  end

  def create

    @project = current_user.projects.create(permitted_params)

    if @project.save
      redirect_to projects_path
    else
      render 'new'
    end
  end
  
  def edit
    # @project = Project.find(params[:id])
    @project = current_user.projects.find(params[:id])

  end

  def show
    redirect_to project_drawings_path(params[:id])
    # @project = Project.find(params[:id])
    # @project = current_user.projects.find(params[:id])
    # params[:project_id] = params[:id]
  end


  def update
    # @project = Project.find(params[:id])
    @project = current_user.projects.find(params[:id])
    if @project.update(permitted_params)
      redirect_to project_path
    else
      render 'edit'
    end
  end

  def destroy
    # @project = Project.find(params[:id])
    @project = current_user.projects.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  protected
  def permitted_params
    params.require(:project).permit(:name, :description)
  end

end
