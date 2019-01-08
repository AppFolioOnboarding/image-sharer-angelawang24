Rails.application.routes.draw do
  get 'images/index'
  get 'images/new'
  get 'images/create'
  resources :images
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'

end
