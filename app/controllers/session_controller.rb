class SessionController < ApplicationController

  def index
    @new_user = User.new
    if logged_in?
      render :index
    else
      render :welcome, layout: false
    end
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
    else
      flash[:error] = 'Login unsuccessful. Please try again.'
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def facebook

  end

end
