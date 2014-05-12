Rails.application.routes.draw do

  root 'home#index'

  get '/home' => 'home#index'
  get '/session' => 'session#create'

  resources :users, only: [:create, :destroy, :update, :show, :index]

end
