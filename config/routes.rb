Rails.application.routes.draw do
  root to: 'pages#about'

  # when you try to link you can do something like
  # <%= link_to: 'About Us', about_path %> 'about' in 'about_path' is from 'as'
  get 'about', to: 'pages#about', as: 'about'

  get 'foods/index'
  get 'foods/show'
  get 'chefs/index'
  get 'chefs/show'
  get 'restaurants/index'
  get 'restaurants/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
