Rails.application.routes.draw do
  
=begin
  #get 'post/new'
  #get 'post/create'
  
  #resources :posts, only: [:new, :create, :index]
  #  root 'posts#index'

  root 'posts#index'
  #root 'sessions#new'
  
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'
  
  get  '/post', to: 'posts#new'
  post '/post', to: 'posts#create'
  
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
=end

  root 'posts#index'
  
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'
  
  get  '/newpost', to: 'posts#new'
  post '/newpost', to: 'posts#create'
  
  resources :users
  resources :posts, only: [:new, :create, :index]

end
