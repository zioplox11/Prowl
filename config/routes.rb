Rails.application.routes.draw do

  # root 'welcome#index'

  root 'home#index'

  get '/login' => 'login#create'

  resources :users, only: [:create, :destroy, :update, :show, :index]


  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

end
