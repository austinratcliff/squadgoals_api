Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'user_token', to: 'user_token#create'
  resources :users
  resources :visions
  resources :goals
  resources :sub_goals
  resources :categories
  resources :tags
  resources :taggings
  resources :cheers
  resources :request_statuses
  resources :connections
  resources :squads
  resources :squad_members
end
