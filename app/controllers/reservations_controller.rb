class ReservationsController < ApplicationController
  def index
    @active_menu = 'reservations'

    @toilets = Toilet.all
  end
end
