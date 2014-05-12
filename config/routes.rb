Rails.application.routes.draw do

  # root 'welcome#index'

  root 'home#index'

  get '/session' => 'session#create'

  resources :users, only: [:create, :destroy, :update, :show, :index] do
      resources :messages,  only: [:create, :destroy, :update, :show, :index]
      resources :posts,  only: [:create, :destroy, :update, :show, :index]
      resources :interests,  only: [:create, :destroy, :update, :show, :index]
      resources :photos,  only: [:create, :destroy, :update, :show, :index]
end


  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

end
