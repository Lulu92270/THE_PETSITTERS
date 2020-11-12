Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/profile', to: 'pages#profile' # in pages controller
  patch '/change_role', to: 'pages#change_role'

  resources :pets, only: [ :index, :show, :new, :create ] do
    resources :bookings, only: [ :new, :create ]
  end

  resources :bookings, only:[ :destroy, :show ]
end
