Rails.application.routes.draw do

  root 'session#index'
  get  '/home'   => 'session#index'
  post '/login'  => 'session#create'
  get  '/logout' => 'session#destroy'
  post '/auth/facebook' => 'session#facebook'


  resources :users, only: [:create, :destroy, :update, :show, :index] do
      resources :messages,  only: [:create, :destroy, :update, :show, :index]
      resources :posts,  only: [:create, :destroy, :update, :show, :index]
      resources :interests,  only: [:create, :destroy, :update, :show, :index]
      resources :photos,  only: [:create, :destroy, :update, :show, :index]
  end

end
