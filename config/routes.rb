# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get '/spa', to: 'spa#index'

  get 'explore/index'

  get 'explore/show'

  resources :users, only: [:show]
  resources :feeds do
    post :follow
    post :unfollow
    get :refresh
  end

  resources :stories
  resources :sessions
  resources :explore, only: [:index, :show]
  get '/auth/:provider/callback', to: 'sessions#create'
end
