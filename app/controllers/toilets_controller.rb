class ToiletsController < ApplicationController

  skip_before_action :verify_authenticity_token

  before_action :find_toilet, only: [:show, :update, :keepalive]

  def index
    @toilets = Toilet.all
  end

  def update
    if @toilet.update(toilet_params)
      render 'show'
    else
      render json: @toilet.errors, status: :unprocessable_entity
    end
  end

  def keepalive
    @toilet.update_column('last_keep_alive_at', Time.now.utc)

    head :ok
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
