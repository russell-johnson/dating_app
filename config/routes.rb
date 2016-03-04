Rails.application.routes.draw do
root 'users#index'

  resources :users do
    resources :addresses
    resources :interests
    resources :bios
  end

end
