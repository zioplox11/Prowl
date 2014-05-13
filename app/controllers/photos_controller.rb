class PhotosController < ApplicationController

  def index
    @photos = Photo.all
    render json: @photos
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
        format.json { render json: {status: "successfully created!"} }
    else
        format.json { render json: @photo.errors, status: :unprocessable_entity }
    end
  end

  def show
    render json: @photo
  end

  def destroy
    if @photo.destroy
      format.json { render json: {status: "successfully deleted!"} }
    else
      format.json { render json: @photo.errors, status: :unprocessable_entity }
    end
  end

  def update
    if @photo.update(photo_params)
      format.json { render json: {status: "successfully updated!"} }
    else
      format.json { render json: @photo.errors, status: :unprocessable_entity }
    end
  end

  private

    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photos_params
      params.require(:photo).permit(
        :user_id,
        :image_url,
        :description
        :profile,
        :created_at,
        :updated_at,
      )
    end

end
