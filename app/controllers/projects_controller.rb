class ProjectsController < ApplicationController

before_filter :authenticate_user!

  def index
    @projects = Project.all()
  end

  def edit
    @project = Project.find(params[:id])
  end
end
