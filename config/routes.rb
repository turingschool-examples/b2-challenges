Rails.application.routes.draw do
  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:id', to: 'mechanics#show'
  get '/mechanics/:id', to: 'mechanics#edit'
  post '/mechanics/:id', to: 'mechanics#update'

  get '/rides', to: 'rides#index'
end
