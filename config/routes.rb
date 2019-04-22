require 'sidekiq/web'
require 'admin_constraint'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq', constraints: AdminConstraint.new

  root 'home#index'

  resources :members, only: [:create]

  get 'signup' => 'members#new', as: :signup
  get 'logout' => 'members#logout', as: :logout
  get 'profile(/:id)' => 'members#show', as: :profile
  get 'friends(/:id)' => 'members#friends', as: :friends
  get 'add_friend/:id' => 'members#add_friend', as: :add_friend
end
