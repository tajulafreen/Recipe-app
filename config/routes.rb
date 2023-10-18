Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :new, :create, :destroy, :update] do
    resources :recipe_foods, only: [:show, :create, :new, :destroy] 
  end
  resources :users, only: [:index, :show, :new, :create, :destroy]

  get 'public_recipes', to: 'recipes#public_recipes' 
end
