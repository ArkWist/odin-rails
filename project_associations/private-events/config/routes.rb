Rails.application.routes.draw do
  #get 'users/new'
  get 'users/create'
  get 'users/show'

  get '/signup', to: 'users#new'

  resources :users

  #get  '/login', to: 'users#new'
  #post '/login', to: 'users#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
