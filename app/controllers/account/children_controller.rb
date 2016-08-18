
class Account::ChildrenController < ApplicationController
  before_action :set_child, only: [:show, :edit, :update, :destroy]

  def index
    bounds = params[:bounds] ? params[:bounds].split(',') : [-85, -180, 85, 180]
    if params[:center]
      center = params[:center]
      @center = Center.new(address: center)
      @center.save
    end
    @children = Child.within_bounding_box(bounds)
    @children_setting = Child.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@children_setting) do |child, marker|
      marker.lat child.latitude
      marker.lng child.longitude
    end
    respond_to do |format|
      format.html { render 'index', layout: 'children' }
      format.js  { render '_cards' }
    end
  end

  def show
    @availabilities = Availability.all
    @reviews = @child.reviews
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
      redirect_to account_profile_path(@child.user.profile)
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
    @child.destroy
    @child.save
    redirect_to account_profile_path(@child.user.profile)
  end

  private

  def set_child
    @child = Child.find(params[:id])
  end

  def child_params
    params.require(:child).permit(:name, :address, :age, :sex, :description, :photo, :photo_cache)
  end
end


