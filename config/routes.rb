Rails.application.routes.draw do
  resources :recipes do
    resources :recipe_ingredients
  end 
  resources :ingredients
  resources :recipe_ingredients

  root 'recipes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
