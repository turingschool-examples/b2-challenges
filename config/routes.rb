Rails.application.routes.draw do
  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:id', to: 'mechanics#show'
  get '/mechanics/:id', to: 'mechanics#update'

  post '/mechanics/:id', to: 'mechanic_rides#create'

  get '/rides', to: 'rides#index'
end
