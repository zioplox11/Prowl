class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all
    render json: @posts
  end

  def create
    @post = Post.new(photo_params)
    if @post.save
      render json: { status: "successfully created!" }
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @post
  end

  def destroy
    if @post.destroy
      render json: { status: "successfully deleted!" }
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: { status: "successfully updated!" }
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def posts_params
      params.require(:posts).permit(
        :user_id,
        :title,
        :body,
        :created_at,
        :updated_at,
      )
    end

end
