class HomeController < ApplicationController

  def index
    if logged_in?
      render :index
    else
      @new_user = User.new
      binding.pry
      render layout: 'welcome'
    end
  end

end
