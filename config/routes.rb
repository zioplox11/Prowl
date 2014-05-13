Rails.application.routes.draw do

  root 'home#index'
  get '/home' => 'home#index'

  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'

  resources :users, only: [:create, :destroy, :update, :show, :index] do
      resources :messages,  only: [:create, :destroy, :update, :show, :index]
      resources :posts,  only: [:create, :destroy, :update, :show, :index]
      resources :interests,  only: [:create, :destroy, :update, :show, :index]
      resources :photos,  only: [:create, :destroy, :update, :show, :index]
end

end
