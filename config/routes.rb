Rails.application.routes.draw do
  get 'welcome/:name', to: 'welcome#show'
  get 'user/show', to: 'user#show'
  get 'gossip/:id', to: 'gossip#show'
  root 'home#show'
  get 'contact/show', to: 'contact#show'
  get 'team/show', to: 'team#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
