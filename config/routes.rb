# frozen_string_literal: true
Rails.application.routes.draw do
  resource :user
  resources :feeds
  resources :stories

  root to: 'home#index'

  get 'sessions/create'

  get 'sessions/destroy'

  get '/auth/:provider/callback', to: 'sessions#create'
end
