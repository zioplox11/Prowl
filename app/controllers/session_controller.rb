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
    if omniauth_hash
      user = facebook_login
    else
      user = vanilla_login
    end

    if user
      session[:user_id] = user.id
    else
      flash[:error] = 'Login unsuccessful. Please try again.'
    end

    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def facebook_login
    binding.pry
    User.find_or_create_from_auth_hash(omniauth_hash)
  end

  def vanilla_login
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      return user
    else
      return nil
    end
  end

  def omniauth_hash
    request.env['omniauth.auth']
  end

end
