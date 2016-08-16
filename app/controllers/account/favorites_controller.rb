class Account::FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all.order( id: :desc )
  end

end
