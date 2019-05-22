Rails.application.routes.draw do
  devise_for :users

  root "photos#index"

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :photos, shallow: true do 
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:index, :create, :destroy],  shallow: true
  end

  resources :relationships, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
