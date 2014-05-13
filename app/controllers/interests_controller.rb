class InterestsController < ApplicationController

  def index
    @interests = Interest.all
    render json: @interests
  end

  def create
    @interest = Interest.new
    if @interest.save
        format.json { render json: {status: "successfully added!"} }
    else
        format.json { render json: @interest.errors, status: :unprocessable_entity }
    end
  end

  def show
    render json: @interest
  end

  def destroy
    if @interest.destroy
      format.json { render json: {status: "successfully deleted!"} }
    else
      format.json { render json: @interest.errors, status: :unprocessable_entity }
    end
  end

  def update
    if @interest.update(interest_params)
      format.json { render json: {status: "successfully updated!"} }
    else
      format.json { render json: @interest.errors, status: :unprocessable_entity }
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
