class ChildrenController < ApplicationController
    before_action :set_children, only: [:show, :edit, :update, :destroy]
    skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @children = Child.all
  end

  def show
  end

  def new
    @child = Child.new
  end

  def edit
  end

  def create
    @child = Child.new(profile_params)
    if @child.save
      redirect_to @children_index_path
    else
      render :new
    end
  end

  def update
    if @child.update(child_params)
      redirect_to @children_index_path
    else
      render :edit
    end
  end

  def destroy
    @child.destroy
    redirect_to @children_index_path
  end

  private

  def set_child
    @child = Child.find(params[:id])
  end

  def profile_params
    params.require(:child).permit(:name, :address, :age, :sex, :description)
  end
end


