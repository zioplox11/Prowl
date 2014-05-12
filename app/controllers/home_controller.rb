class HomeController < ApplicationController

  def index
    if logged_in?
      render :index
    else
      @new_user = User.new
      render layout: false
      render :welcome
    end
  end

end
