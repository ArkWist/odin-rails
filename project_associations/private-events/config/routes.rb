Rails.application.routes.draw do

  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get    '/signup', to: 'users#new'
  post   '/signup', to: 'users#create'
  get    'users/show'

  resources :users
  resources :events do
    resources :invite
  end

end
