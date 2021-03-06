Rails.application.routes.draw do

  post '/auth/login', to: 'authentications#login'
  mount ActionCable.server => '/cable'
  namespace :api do
    namespace :v1 do
      get '/', to: 'home#index'
      # post 'user_token' => 'user_token#create'
      resources :users
      get 'user_parking' => 'parkings#user_parking'
      get 'current_user' => 'users#current'
      resources :addresses
      resources :comments
      resources :parkings
      resources :garages
      get 'garage_by_user/:id' => 'garages#garageByUserId'
      resources :vehicles
      get 'garageComments/:garage_id', to: 'comments#comments'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
