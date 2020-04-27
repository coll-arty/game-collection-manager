Rails.application.routes.draw do
  scope module: 'games' do
    root 'collection_items#index'
    resources :collection_items do
      resources :loans, only: [:new, :create, :destroy]
    end
  end
  mount RailsEventStore::Browser => '/res' if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
