class PartsController < ApplicationController

before_filter :authenticate_user!

  def index
    @parts = Part.all()
  end
end
