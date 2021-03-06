Rails.application.routes.draw do
  get 'favorites/index'

   devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  namespace :account do
    resources :profiles, except: [:index, :new]
    resources :children do
      resources :bookings
      resources :reviews, except: [:update, :edit]
      resources :availabilities
    end
    resources :favorites, except: [:update, :edit, :create]
  end

  resources :children, only: [:show, :index] do
    resources :booking
    resources :favorites, only: [:create]

  end

end
