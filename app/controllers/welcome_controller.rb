class WelcomeController < ActionController::Base
layout "application"
before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

end
