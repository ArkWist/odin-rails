Rails.application.routes.draw do

  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/show'
  get 'passengers/create'
  root 'flights#index'

  get  'flights',  to: 'flights#index'

  resources :flights,    only: [:index]
  resources :bookings,   only: [:new, :create, :show]
  resources :passengers, only: [:create]

end
