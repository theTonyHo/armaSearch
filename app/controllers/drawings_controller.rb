class DrawingsController < ApplicationController

before_filter :authenticate_user!

  def index
    @drawings = Drawing.all()
  end
end
