™class DrawingsController < ApplicationController

before_filter :authenticate_user!
before_action :get_project

  def index
    @drawings = Drawing.all()
  end

 def new
    @drawing = Drawing.new
  end

  def create
    @drawing = Drawing.new(permitted_params)
    
    if @drawing.save
      redirect_to project_drawings_path
    else
      render 'new'
    end
  end

  def edit
    @drawing = Drawing.find(params[:id])
  end

  def show
    @drawing = Drawing.find(params[:id])
  end

  def update
    @drawing = Drawing.find(params[:id])
    if @drawing.update(permitted_params)
      redirect_to project_drawing_path
    else
      render 'edit'
    end
  end

  def get_project
    @project = Project.find(params[:project_id])
  end

  protected
  def permitted_params
    params.require(:drawing).permit(:number)
  end
end
