Rails.application.routes.draw do
  resources :seaplanes
  devise_for :users
  root to: 'pages#home'

  resources :bookings do
    member do
      post :approve
      post :reject
    end
    collection do
      get :my_bookings
      get :my_requests
    end
    resources :reviews, only: [:create]
  end
end
