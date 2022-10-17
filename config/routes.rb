Rails.application.routes.draw do
  resources :users
  post 'import_users', to: 'users#import_users'
  get 'export_into_csv', to: 'users#export_into_csv'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
