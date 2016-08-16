class Account::ProfilesController < ApplicationController

  def show
    @profile = Profile.new
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to @profile
    else
      render :new
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy
    redirect_to profiles_path
  end

  private
  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:address, :credit_card, :description, :age, :sex)
  end
end
