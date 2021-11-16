Rails.application.routes.draw do
  resources :seaplanes do
    resources :bookings, only: [:create]
  end
  devise_for :users
  root to: 'pages#home'

  resources :bookings, except: [:create] do
    member do
      patch :approve
      patch :reject
    end
    collection do
      get :my_bookings
      get :my_requests
    end
    resources :reviews, only: [:create]
  end
end
