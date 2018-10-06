Rails.application.routes.draw do
  get 'foods/index'
  get 'foods/show'
  get 'chefs/index'
  get 'chefs/show'
  get 'restaurants/index'
  get 'restaurants/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
