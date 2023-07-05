Rails.application.routes.draw do
  resources :patients, only: [:index, :create, :destroy]
  resources :nurses
  resources :doctors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/patients', to: 'patients#create'
  post '/login', to: 'patients#login'
  get '/appointments', to: 'patients#appointments'
  post '/appointments', to: 'patients#book_appointment'
  delete '/appointments/:id', to: 'patients#delete_appointment'
  # Defines the root path route ("/")
  # root "articles#index"
end
