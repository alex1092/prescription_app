Rails.application.routes.draw do
 
  resources :scripts
  devise_for :users
  root 'pages#index'

end
