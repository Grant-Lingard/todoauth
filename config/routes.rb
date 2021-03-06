Rails.application.routes.draw do
  resources :tasks do
    resources :notes
  end
  
  resources :reminders
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
  get 'about' => 'sites#about'
  get 'register' => 'users#new'
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  get 'auth/:provider/callback' => "authentications#create"

  root 'sites#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
