Rails.application.routes.draw do

  get 'static_pages/home'

  root 'static_pages#home'

  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get    '/signup', to: 'users#new'
  #post   '/signup', to: 'users#create'

  resources :users
  resources :events do
    resources :invite, only: [:create, :destroy]
  end

end
