class PostsController < ApplicationController

  def index
    @posts = Post.all
    render json: @posts
  end

  def create
    @post = Post.new(photo_params)
    if @post.save
        format.json { render json: {status: "successfully created!"} }
    else
        format.json { render json: @post.errors, status: :unprocessable_entity }
    end
  end

  def show
    render json: @post
  end

  def destroy
    if @post.destroy
      format.json { render json: {status: "successfully deleted!"} }
    else
      format.json { render json: @post.errors, status: :unprocessable_entity }
    end
  end

  def update
    if @post.update(post_params)
      format.json { render json: {status: "successfully updated!"} }
    else
      format.json { render json: @post.errors, status: :unprocessable_entity }
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
