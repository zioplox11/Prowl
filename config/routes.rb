Rails.application.routes.draw do

  root 'session#index'
  post '/login'  => 'session#create'
  get  '/logout' => 'session#destroy'
  get '/auth/facebook/callback' => 'session#create'

  get '/matches'  => 'search#matches'
  get '/search'   => 'search#search'

  get '/messages/:id' => 'messages#conversation'
  resources :messages, only: [:create, :destroy, :index]


  get '/users/localprofiles' => 'users#local_profiles'

  resources :users,     only: [:create, :destroy, :show, :update, :index]
  resources :interests, only: [:create, :destroy, :show, :update]
  resources :posts,     only: [:create, :destroy, :show, :index]
  resources :photos,    only: [:create, :destroy, :show, :index]


end
