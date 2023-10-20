Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  get 'public_recipes', to: 'recipes#public_recipes' 
  resources :recipes, except: %i[edit update, :update] do
    resources :recipe_foods, except: %i[edit update]
    collection do
     
    end
    member do
      get 'general_shopping_list'
    end
  end
  resources :recipe_foods, only: [:new, :create, :destroy] do
    patch :modify, on: :member
  end
  resources :users, only: [:index, :show, :new, :create, :destroy]

end
