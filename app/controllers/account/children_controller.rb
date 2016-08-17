
class Account::ChildrenController < ApplicationController
  before_action :set_child, only: [:show, :edit, :update, :destroy]

  def index
    @children = Child.all.order(id: :desc)
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

  def new
    @child = Child.new
  end

  def edit
  end

  def create
    @child = Child.new(child_params)
    @child.user = current_user
    if @child.save
      redirect_to account_children_path
    else
      render :new
    end
  end

  def update
    if @child.update(child_params)
      redirect_to account_child_path(@child)
    else
      render :edit
    end
  end

  def destroy
    @child.active = false
    @child.save
    redirect_to account_children_path
  end

  private

  def set_child
    @child = Child.find(params[:id])
  end

  def child_params
    params.require(:child).permit(:name, :address, :age, :sex, :description, :photo, :photo_cache)
  end
end


