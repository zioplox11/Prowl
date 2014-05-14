# Prowl as of 5/11/14 is CRUDing through JavaScript
# so all HTML responses and controller actions have
# been commented out. Can be uncommented later if
# there is need for new pages and actions to CRUD
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    render json: @user
  end

  # POST /users
  # POST /users.json
  def create
    @user = VanillaUser.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render 'session/index'
    else
      flash[:error] = "That username or email is already in use. Please try again"
      redirect_to root_path
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render json: {status: "successfully updated!"} }
      else
        # format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      # format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      if params[:vanilla_user]
        user_data = params[:vanilla_user]
      elsif params[:facebook_user]
        user_data = params[:facebook_user]
      end
      user_data.permit(
        :username,
        :password,
        :password_confirmation,
        :height,
        :sexual_orientation,
        :body_type,
        :birthdate,
        :email,
        :gender,
        :borough,
        :neighborhood,
        :ethnicity,
        :diet,
        :drugs,
        :drinks,
        :smokes,
        :zodiac_sign,
        :education,
        :job,
        :income,
        :relationship_status,
        :relationship_type,
        :children_family,
        :languages,
        :pets,
        :self_summary,
        :looking_for,
        :created_at,
        :updated_at,
        :zip
      )
    end
end
