class Account::ProfilesController < ApplicationController

  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def show
    @children = Child.all
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to account_profile_path(@profile)
    else
      render :new
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to account_profile_path(@profile)
    else
      render :edit
    end
  end

  def destroy
    user = current_user
    sign_out current_user
    user.destroy
    redirect_to root_path
  end

  private

  def set_profile
    @profile = Profile.find_by(id: params[:id])
  end

  def profile_params
    params.require(:profile).permit(:address, :credit_card, :description, :age, :sex, :name)
  end


end
