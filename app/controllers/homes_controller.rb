class HomesController < ApplicationController
  def index
    @active_menu = 'home'
  end

  def about
    @active_menu = 'about'
  end
end
