Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :appointments, only: %i[create index]
      resources :restaurants
      resources :users, only: [:create]
      resources :authentication, only: %i[create destroy]
    end
  end
end
