Rails.application.routes.draw do
  #devise_for :users
  devise_for :users, controllers: {
          #sessions: 'users/sessions',
          registrations: 'users/registrations'
        }
  resources :users
  # resources :users, only: [:index, :show]
  
  get "up" => "rails/health#show", as: :rails_health_check
  root "articles#home"
  
  resources :articles do
    resources :comments
  end

  namespace :api do
    namespace :v1 do
      resources :articles do
        resources :comments
      end
      devise_for :users
    end
  end

  
end
