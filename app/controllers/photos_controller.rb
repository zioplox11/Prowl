class PhotosController < ApplicationController

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

    def photos_params
      params.require(:photo).permit(
        :user_id,
        :image_url,
        :description
        :profile,
        :created_at,
        :updated_at
      )
    end

end
