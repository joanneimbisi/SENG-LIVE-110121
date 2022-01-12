Rails.application.routes.draw do
  resources :businesses, only: [:index, :show, :create]
  resources :reviews, only: [:create]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
