Rails.application.routes.draw do
  root to: "links#index"

  resources :links, only: [:index, :new, :create, :edit, :update]
  resources :users, only: [:new, :create]

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
