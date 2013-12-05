class PartsController < ApplicationController

before_filter :authenticate_user!
before_action :get_project

  def index
    @parts = @project.parts
  end

 def new
    @part = @project.parts.build()
  end

  def create
    @part = @project.parts.create(permitted_params)
    
    if @part.save
      redirect_to project_parts_path
    else
      render 'new'
    end
  end

  def edit
    # @part = Part.find(params[:id])
    @part = @project.parts.find(params[:id])
  end

  def show
    # @part = Part.find(params[:id])
    @part = @project.parts.find(params[:id])
  end

  def update
    # @part = Part.find(params[:id])
    @part = @project.parts.find(params[:id])
    if @part.update(permitted_params)
      redirect_to project_part_path
    else
      render 'edit'
    end
  end

  def destroy
    # @part = Part.find(params[:id])
    @part = @project.parts.find(params[:id])
    @part.destroy
    redirect_to project_parts_path
  end

  def get_project
    # @project = Project.find(params[:project_id])
    @project = current_user.projects.find(params[:project_id])
  end

  protected
  def permitted_params
    params.require(:part).permit(:name)
  end
end
