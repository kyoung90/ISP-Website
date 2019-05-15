Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user, only: [:edit, :update, :create, :new, :show]
  resources :payments, only: [:index]
  resources :internet_packages, only: [:index, :show] do 
    resources :payments, only: [:new, :create]
  end 

  resources :service_periods, only: [:index]
  # resources :session, only: [:new, :create]
  get "/logout", to: "session#destroy", as: "logout"
  get "/login", to: "session#new", as: "new_session"
  post "/login", to: "session#create", as: "session_create"
  get '/auth/facebook/callback' => 'session#create'

  get "/", to: "application#home", as: "root"  

end
