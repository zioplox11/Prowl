class InterestsController < ApplicationController

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

    def interests_params
      params.require(:interests).permit(
        :interest,
        :created_at,
        :updated_at,
      )
    end

end
