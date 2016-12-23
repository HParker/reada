# frozen_string_literal: true
# == Route Map
#
#           Prefix Verb   URI Pattern                        Controller#Action
#             user POST   /user(.:format)                    users#create
#         new_user GET    /user/new(.:format)                users#new
#        edit_user GET    /user/edit(.:format)               users#edit
#                  GET    /user(.:format)                    users#show
#                  PATCH  /user(.:format)                    users#update
#                  PUT    /user(.:format)                    users#update
#                  DELETE /user(.:format)                    users#destroy
#            feeds GET    /feeds(.:format)                   feeds#index
#                  POST   /feeds(.:format)                   feeds#create
#         new_feed GET    /feeds/new(.:format)               feeds#new
#        edit_feed GET    /feeds/:id/edit(.:format)          feeds#edit
#             feed GET    /feeds/:id(.:format)               feeds#show
#                  PATCH  /feeds/:id(.:format)               feeds#update
#                  PUT    /feeds/:id(.:format)               feeds#update
#                  DELETE /feeds/:id(.:format)               feeds#destroy
#          stories GET    /stories(.:format)                 stories#index
#                  POST   /stories(.:format)                 stories#create
#        new_story GET    /stories/new(.:format)             stories#new
#       edit_story GET    /stories/:id/edit(.:format)        stories#edit
#            story GET    /stories/:id(.:format)             stories#show
#                  PATCH  /stories/:id(.:format)             stories#update
#                  PUT    /stories/:id(.:format)             stories#update
#                  DELETE /stories/:id(.:format)             stories#destroy
#             root GET    /                                  home#index
#  sessions_create GET    /sessions/create(.:format)         sessions#create
# sessions_destroy GET    /sessions/destroy(.:format)        sessions#destroy
#                  GET    /auth/:provider/callback(.:format) sessions#create
#

# frozen_string_literal: true
Rails.application.routes.draw do
  get 'explore/index'

  get 'explore/show'

  resources :users, only: [:show]
  resources :feeds do
    post :follow
    post :unfollow
    get :refresh
  end

  resources :stories

  root to: 'home#index'

  get 'sessions/create'

  get 'sessions/destroy'

  get '/auth/:provider/callback', to: 'sessions#create'
end
