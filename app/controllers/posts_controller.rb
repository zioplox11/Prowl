class PostsController < ApplicationController

  def index

  end

  def create

  end

  def show

  end

  def destroy

  end

  def update

  end

  private

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
