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
    find_or_create_from_auth_hash(omniauth_hash)
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

  def find_or_create_from_auth_hash(auth_hash)
    user = User.find_by(email: auth_hash['info']['email'])
    if user
      user.update(
        fb_token:      auth_hash['credentials']['token'],
        fb_expiration: auth_hash['credentials']['expires_at']
        )
    else
      random_password = Array.new(14).map { (65 + rand(58)).chr }.join
      user = User.create(
        username:      random_username(auth_hash),
        email:         auth_hash['info']['email'],
        fb_token:      auth_hash['credentials']['token'],
        fb_expiration: auth_hash['credentials']['expires_at'],
        password:      random_password,
        password_confirmation: random_password
        )
    end
    return user
  end

  def random_username(auth_hash)
    found_name = false
    until found_name
      random_name = auth_hash['info']['first_name'].downcase + rand(9999).to_s
      if User.find_by(username: random_name ).nil?
        username = random_name
        found_name = true
      end
    end
    return username
  end

end
