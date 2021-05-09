Rails.application.routes.draw do
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :appointments, only: %i[create index]
  resources :restaurants
  resources :users, only: [:create]
  post '/login', to: 'users#login'
  get '/auto_login', to: 'users#auto_login'
  delete '/logout', to: 'users#logout'
end
