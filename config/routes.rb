Rails.application.routes.draw do
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :appointments, only: %i[create index]
    resources :restaurants
  end
  resources :users, only: [:create]
  resources :authentication, only: [:create]
end
