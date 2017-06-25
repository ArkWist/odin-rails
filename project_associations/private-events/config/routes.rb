Rails.application.routes.draw do
  
  #get  'invite/new'
  #post 'invite/create'
  #get  'invite/show'
  
  get 'invite', to: 'events#invite'

  #get  '/newevent', to: 'events#new'
  #post '/newevent', to: 'events#create'
  get  'events/show'
  get  'events/index'
  get  'events/new'
  post 'events/create'
  
  #get  '/events/new', to: 'events#new'
  #post '/events/new', to: 'events#create'
  
  # MAKE NEWEVENT USE /events/new

  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get    '/signup', to: 'users#new'
  post   '/signup', to: 'users#create'
  get    'users/show'

  resources :users, :events#, :invites

  #get  '/login', to: 'users#new'
  #post '/login', to: 'users#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
