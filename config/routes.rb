Rails.application.routes.draw do
  get 'bios/index'

  get 'bios/new'

  get 'bios/show'

  get 'bios/edit'

root 'users#index'

  resources :users do 
    resources :addresses 
    resources :interests 
    resources :bios
  end

end
