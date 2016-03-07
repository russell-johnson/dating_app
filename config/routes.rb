Rails.application.routes.draw do
root 'shared#index'
#root 'users#index'

  resources :users do
    resources :addresses
    resources :interests
    resources :bios
  end

  get 'show_females', to: "users#show_females"
  get 'show_males', to: "users#show_males"

end
