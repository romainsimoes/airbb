Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  get '/home', to: 'pages#home'

  namespace :account do
    resources :profiles, except: [:index]
    resources :children do
      resources :reviews, except: [:update, :edit]
    end
    resources :favorites, except: [:update, :edit]
  end

  resources :children do
    resources :booking
  end
end
