Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/sign-up", to: "users#create"
  post "/login", to: "user_token#create"

  get "/status", to: "status#index"
  get "/status/user", to: "status#user"

  resources :restaurants do
    resources :menus, only: [:create, :update, :destroy]
    resources :contact_infos, only: [:create, :update, :destroy]
  end

  resources :items do
    resources :ingredients, only: [:create, :update, :destroy]
    resources :sizes, only: [:create, :update, :destroy]
  end
  resources :tags, only: [:index,:create]
  resources :themes, only: [:show, :create, :update, :destroy]
end
