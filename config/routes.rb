Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:create] 
  end
  resources :users, only: [:index, :show, :new, :create, :destroy]
end
