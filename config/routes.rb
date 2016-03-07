Rails.application.routes.draw do
root 'shared#index'

get '/signup', to: 'users#new', as: 'signup'
get '/login', to: 'sessions#new', as: 'login'
get '/logout', to: 'session#destroy', as: 'logout'

post '/signup', to: 'users#create'
post '/login', to: 'sessions#create'

  resources :users do
    resources :addresses
    resources :interests
    resources :bios
  end

  get 'show_females', to: "users#show_females"
  get 'show_males', to: "users#show_males"

end
