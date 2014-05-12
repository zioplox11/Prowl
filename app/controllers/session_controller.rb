class SessionController < ApplicationController

  def create

  end


  def destroy

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to(root_path)
    else
      render :new
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
