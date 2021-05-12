Rails.application.routes.draw do
  resources :welcome, only: [:show]
  resources :user, only: [:show]
  resources :city, only: [:show]

  resources :gossip do
    resources :comments do
      resources :comments
    end
  end

  resources :contact, only: [:index]
  resources :team, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
