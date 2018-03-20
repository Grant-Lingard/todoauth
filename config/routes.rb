Rails.application.routes.draw do
  resources :tasks do
    resources :notes
  end
  
  resources :users
  
  get 'about' => 'sites#about'
  get 'signup' => 'users#new'

  root 'sites#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
