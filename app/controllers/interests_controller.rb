class InterestsController < ApplicationController

  def index
    @interests = Interest.all
    render json: @interests
  end

  def create
    @interest = Interest.new
    if @interest.save
      render json: { status: "successfully added!" }
    else
      render json: @interest.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @interest
  end

  def destroy
    if @interest.destroy
      render json: { status: "successfully deleted!" }
    else
      render json: @interest.errors, status: :unprocessable_entity
    end
  end

  def update
    if @interest.update(interest_params)
      render json: { status: "successfully updated!" }
    else
      render json: @interest.errors, status: :unprocessable_entity
    end
  end

  private

    def interests_params
      params.require(:interests).permit(
        :interest,
        :created_at,
        :updated_at,
      )
    end

end
