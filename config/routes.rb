Rails.application.routes.draw do

  root 'session#index'
  post '/login'  => 'session#create'
  get  '/logout' => 'session#destroy'
  get '/auth/facebook/callback' => 'session#create'

  resources :messages, only: [:create, :destroy, :index]
  get '/messages/:id' => 'messages#conversation'

  resources :users, only: [:create, :destroy, :update, :show, :index]
  resources :posts, only: [:create, :destroy, :update, :show, :index]
  resources :interests, only: [:create, :destroy, :update, :show, :index]
  resources :photos, only: [:create, :destroy, :update, :show, :index]

end
