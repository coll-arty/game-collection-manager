# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: 'games' do
    root 'collection_items#index'
    resources :collection_items do
      resources :loans, only: %i[new create destroy]
    end
  end
  mount RailsEventStore::Browser => '/res' if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
