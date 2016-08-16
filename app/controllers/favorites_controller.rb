class FavoritesController < ApplicationController
  before_action :set_child_id

  def create
    @favorite = Favorite.new
    @favorite.user_id = current_user.id
    @favorite.child_id = @child
    if Favorite.where(child_id: @favorite.child_id, user: @favorite.user_id).any?
      flash[:alert] = "Already added"
      redirect_to children_path
    else
      @favorite.save
      flash[:notice] = "Child successfully added"
      redirect_to account_favorites_path
    end
  end

  private

  def set_child_id
    @child = params[:child_id]
  end

end
