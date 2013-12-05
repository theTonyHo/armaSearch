class DrawingsController < ApplicationController

before_filter :authenticate_user!
before_action :get_project

  def index
    @drawings = @project.drawings
  end

 def new
    @drawing = @project.drawings.build()
  end

  def create
    @drawing = @project.drawings.create(permitted_params)

    if @drawing.save
      redirect_to project_drawings_path
    else
      render 'new'
    end
  end

  def edit
    # @drawing = Drawing.find(params[:id])
    @drawing = @project.drawings.find(params[:id])
  end

  def show
    # @drawing = Drawing.find(params[:id])
    @drawing = @project.drawings.find(params[:id])
  end

  def update
    # @drawing = Drawing.find(params[:id])
    @drawing = @project.drawings.find(params[:id])
    if @drawing.update(permitted_params)
      redirect_to project_drawing_path
    else
      render 'edit'
    end
  end

  def destroy
    # @drawing = Drawing.find(params[:id])
    @drawing = @project.drawings.find(params[:id])
    @drawing.destroy
    redirect_to project_drawings_path
  end

  def get_project
    # @project = Project.find(params[:project_id])
    @project = current_user.projects.find(params[:project_id])
  end

  protected
  def permitted_params
    params.require(:drawing).permit(:name, :attachment)
  end
end
