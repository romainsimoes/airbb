class Account::FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all.order( id: :desc )
  end

  def destroy

    redirect_to account_favorites_path
  end
end
