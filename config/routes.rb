Rails.application.routes.draw do
 
  resources :scripts
  devise_for :users
  root 'pages#index'
  get "pages/about", to: "pages#about", as: "about"
  get "pages/contact_us", to: "pages#contact_us", as: "contact"

end
