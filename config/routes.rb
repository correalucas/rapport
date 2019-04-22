require 'sidekiq/web'
require 'admin_constraint'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq', constraints: AdminConstraint.new

  root 'home#index'

  resources :members, only: [:create, :show]
  get 'signup' => 'members#new', as: :signup
end
