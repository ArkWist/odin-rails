Rails.application.routes.draw do
  
  get 'bookings/new'

  get 'bookings/create'

  get 'bookings/show'

  get 'passengers/create'

  get 'passenger/create'

  root 'flights#index'
  get  '/flights',     to: 'flights#index'


  get 'flights/show'
  get 'flights/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
