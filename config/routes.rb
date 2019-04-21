Rails.application.routes.draw do
  root 'home#index'

  resources :members, only: [:create, :show]
  get 'signup' => 'members#new', as: :signup
end
