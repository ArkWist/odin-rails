Rails.application.routes.draw do
  #get 'post/new'
  #get 'post/create'
  
  #resources :posts, only: [:new, :create, :index]
  #  root 'posts#index'

  root 'posts#index'
  #root 'sessions#new'
  
  get  '/login',    to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'
  
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
