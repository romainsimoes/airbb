class ChildrenController < ApplicationController
    before_action :set_child, only: [:show, :edit, :update, :destroy]
    skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @children = Child.all
  end

  def show
    @availabilities = Availability.all
    @reviews = Review.all
    @child_coordinates = { lat: @child.latitude, lng: @child.longitude }
    @hash = Gmaps4rails.build_markers(@child) do |child, marker|
      marker.lat child.latitude
      marker.lng child.longitude
    end
  end

  private

  def set_child
    @child = Child.find(params[:id])
  end
end


