Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'mechanics#welcome'

  get '/mechanics/index', to: 'mechanics#index'
  get '/mechanics/:id', to: 'mechanics#show'

  get '/rides/index', to: 'rides#index'
  get '/rides/:id', to: 'rides#show'
  get '/rides/new', to: 'applicants#new'
  post '/rides', to: 'applicants#create'

end
