Rails.application.routes.draw do
  root 'games#index'
  resources :games
  mount RailsEventStore::Browser => '/res' if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
