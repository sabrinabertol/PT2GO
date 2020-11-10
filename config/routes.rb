Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:show]

  resources :sessions, only: [:new, :index, :create, :destroy]

  resources :sessions do
    resources :reviews, only: [:new, :create, :destroy]
    resources :bookings, only: [:new, :create, :destroy]
  end

end
