Rails.application.routes.draw do
  root to: 'pages#about'

  # when you try to link you can do something like
  # <%= link_to: 'About Us', about_path %> 'about' in 'about_path' is from 'as'
  get 'about', to: 'pages#about', as: 'about'

  #get 'foods/index'
  #get 'foods/show'
  resources :foods, only: [:index, :show]

  #get 'chefs/index'
  #get 'chefs/show'
  # seems to work with localhost:3000/chefs
  # for some reason, localhost:3000/chefs/index fails
  resources :chefs, only: [:index, :show]

  get 'restaurants/index'
  get 'restaurants/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
