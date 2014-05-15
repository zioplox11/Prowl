class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/:id
  def show
    render json: @user
  end

  # POST /users
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

  # PATCH/PUT /users/:id
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.json { render json: { status: "successfully updated!" } }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    respond_to do |format|
      format.json { render json: 'Message was successfully deleted', status: :ok }
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
      elsif params[:user]
        user_data = params[:user]
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
