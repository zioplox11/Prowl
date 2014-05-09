Rails.application.routes.draw do

  # root 'welcome#index'

  root 'welcome#index'

  resources :users

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

end
