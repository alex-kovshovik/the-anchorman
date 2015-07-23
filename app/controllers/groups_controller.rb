class GroupsController < ApplicationController

  def index
    @groups = Group.all

    respond_to do |format|
      format.json { render json: @groups, status: :ok }
    end
  end

end