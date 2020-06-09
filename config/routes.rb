Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :services, only: [:index, :show, :create, :destroy]
  put '/services/:id', to: 'services#update'
  get '/login', to: 'auth#create'

end
