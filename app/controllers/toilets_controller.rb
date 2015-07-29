class ToiletsController < ApplicationController

  def index
    toilets = Toilet.all

    respond_to do |format|
      format.json { render json: toilets, status: :ok }
    end
  end

  def update
    toilet = Toilet.find(params[:id])

    if toilet.update(toilet_params)
      render json: toilet, status: :ok
    else
      render json: toilet.errors, status: :unprocessable_entity
    end
  end

  private

  def toilet_params
    params.require(:toilet).permit(:state)
  end

end
