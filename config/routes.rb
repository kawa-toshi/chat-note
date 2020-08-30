Rails.application.routes.draw do
  devise_for :users
  
  root "notes#index"
  resources :notes do
    collection do
      get 'search'
    end
  end
  resources :connections, only: [:index]
  resources :users, only: [:edit, :update]
end
