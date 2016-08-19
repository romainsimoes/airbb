class Account::AvailabilitiesController < ApplicationController

  before_action :set_availability, only: [:show, :edit, :update, :destroy]
  before_action :find_child, only: [:new, :edit, :create, :update, :destroy]

  def index
    @availabilities = Availability.all
  end

  def show
  end

  def new
    @availability = Availability.new
  end

  def edit
  end

  def create
    @availability = Availability.new(availability_params)
    @availability.child = @child
    if @availability.save
      redirect_to account_child_path(@child)
    else
      render :new
    end
  end

  def update
    if @availability.update(availability_params)
      redirect_to account_availability_path(@availability)
    else
      render :edit
    end
  end

  def destroy
    @availability.destroy
    redirect_to account_availabilities_path
  end

  private

  def set_availability
    @availability = Availability.find(params[:id])
  end

  def find_child
    @child = Child.find(params[:child_id])
  end

  def availability_params
    params.require(:availability).permit(:price, :start_time, :end_time)
  end

end
