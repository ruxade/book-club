Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # get "/google_books/search", to: "google_books#search"

  resources :clubs, only: [:index, :new, :create, :show] do
    post "add_user", on: :member
    delete "remove_user", on: :member
  end
  resources :books, only: [:index, :show]
  resources :meetings, only: [:index,:new, :create, :show]
  resources :lists do
    post "add_book", on: :member
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
