Rails.application.routes.draw do
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :appointments, only: %i[create index]
  resources :restaurants
  resources :users, only: [:create]
  resources :authentication, only: [:create]
end
