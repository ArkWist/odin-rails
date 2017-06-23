Rails.application.routes.draw do
  
  
  get 'invite/new'

  get 'invite/create'

  get 'invite/show'

  #get  '/newevent', to: 'events#new'
  #post '/newevent', to: 'events#create'
  get 'events/show'
  get 'events/index'
  
  get  '/events/new', to: 'events#new'
  post '/events/new', to: 'events#create'
  
  # MAKE NEWEVENT USE /events/new

  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  #get 'users/new'
  get 'users/create'
  get 'users/show'

  get '/signup', to: 'users#new'

  resources :users, :events

  #get  '/login', to: 'users#new'
  #post '/login', to: 'users#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
