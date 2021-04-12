Rails.application.routes.draw do
  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:id', to: 'mechanics#show'

  post '/mechanics/:mechanic_id/mechanic_rides', to: 'mechanic_rides#create'
end
