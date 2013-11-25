class ProjectsController < ApplicationController
  
before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @projects = Project.all()
  end
end
