class ChildrenController < ApplicationController
    before_action :set_child, only: [:show, :edit, :update, :destroy]
    skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @children = Child.all
  end

  def show
  end

  private

  def set_child
    @child = Child.find(params[:id])
  end
end


