Rails.application.routes.draw do

  root 'session#index'
  post '/login'  => 'session#create'
  get  '/logout' => 'session#destroy'
  get '/auth/facebook/callback' => 'session#create'

  resources :users, only: [:create, :destroy, :update, :show, :index]
  resources :messages,  only: [:create, :destroy, :update, :show, :index]
  resources :posts,  only: [:create, :destroy, :update, :show, :index]
  resources :interests,  only: [:create, :destroy, :update, :show, :index]
  resources :photos,  only: [:create, :destroy, :update, :show, :index]

end
