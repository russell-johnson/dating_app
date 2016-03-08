Rails.application.routes.draw do
root 'shared#index'

get '/signup', to: 'users#new', as: 'signup'
get '/login', to: 'sessions#new', as: 'login'
get '/logout', to: 'sessions#destroy', as: 'logout'
get '/users/profile/:id', to: 'users#profile', as: 'profile'
get '/users/profile/edit/:id', to: 'users#edit_profile', as: 'profile/edit'

post '/users/profile/edit/:id', to: 'users#update'
post '/users/:id/edit', to: 'users#update'
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
