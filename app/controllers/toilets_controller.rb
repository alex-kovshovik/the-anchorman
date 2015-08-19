class ToiletsController < ApplicationController

  skip_before_action :verify_authenticity_token

  before_action :find_toilet, only: [:show, :update]

  def index
    toilets = Toilet.all

    respond_to do |format|
      format.json { render json: toilets, status: :ok }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @toilet, status: :ok }
    end
  end

  def update
    if @toilet.update(toilet_params)
      render json: @toilet, status: :ok
    else
      render json: @toilet.errors, status: :unprocessable_entity
    end
  end

  private

  def toilet_params
    params.require(:toilet).permit(:state)
  end

  def find_toilet
    @toilet = Toilet.find_by(id: params[:id])

    if @toilet.nil?
      head :not_found
      false
    end

    true
  end

end
