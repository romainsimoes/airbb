class Account::FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all.order( id: :desc )
  end

  def destroy
    child = Child.find(params[:id])
    child.favorites.where(user: current_user).delete_all
    respond_to do |format|
      format.html {
        redirect_to account_favorites_path
      }

      format.json {
        render json: { ok: 'Favorite deleted' }.to_json
      }
    end
  end
end
