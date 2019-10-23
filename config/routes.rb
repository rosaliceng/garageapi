Rails.application.routes.draw do
  root to: 'home#index'
  post '/auth/login', to: 'authentications#login'
  namespace :api do
    namespace :v1 do
      # post 'user_token' => 'user_token#create'
      resources :users
      get 'current_user' => 'users#current'
      resources :addresses
      resources :comments
      resources :parkings
      resources :garages
      resources :vehicles
      get 'garageComments/:garage_id', to: 'comments#comments'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
