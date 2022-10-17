Rails.application.routes.draw do
  resources :users
  post 'import_users', to: 'users#import_users'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
