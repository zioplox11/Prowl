class UsersController < ApplicationController

  def index
    users = User.all
    render json: users.to_json
  end

  def create
    user = User.create(user_params)
    render json: user.to_json
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    user.save
    render json: user.to_json
  end

  def show
    user = User.find(params[:id])
    render json: user
  end


def user_params
    params.require(:user).permit(
        :user_name,
        :password_digest,
        :height,
        :body_type,
        :birthdate,
        :email,
        :admin_status,
        :created_at,
        :updated_at
      )
  end

end
