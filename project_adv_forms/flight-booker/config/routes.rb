Rails.application.routes.draw do
  
  root 'flights#index'
  
  get  'flights',  to: 'flights#index'
  
  get  'bookings', to: 'bookings#new'
  post 'bookings', to: 'bookings#create'

  get 'passengers/create'
  get 'passenger/create'

  resources :flights,    only: [:index]
  resources :bookings,   only: [:new, :create, :show]
  resources :passengers, only: [:create]
  
end
