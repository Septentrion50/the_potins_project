Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :welcome, only: [:show]
  resources :user, only: [:show, :create, :new]
  resources :city, only: [:show]
  resources :likes, only: [:create, :destroy]

  resources :gossips do
    resources :likes, only: [:create, :destroy]
    resources :comments, except: [:index, :new] do
      resources :likes, only: [:create, :destroy]
      resources :comments, except: [:index, :new] do
        resources :likes, only: [:create, :destroy]
      end
    end
  end

  resources :contact, only: [:index]
  resources :team, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
