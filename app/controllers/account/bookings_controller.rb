class Account::BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :find_child, only: [:new, :edit, :create, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def edit
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.child = @child
    @booking.user = current_user
    if @booking.save
      redirect_to account_child_booking_path(@child)
    else
      render :new
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to account_child_booking_path(@booking)
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to account_children_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def find_child
    @child = Child.find(params[:child_id])
  end

  def booking_params
    params.require(:booking).permit(:price, :start_time, :end_time, :child_id)
  end

end
