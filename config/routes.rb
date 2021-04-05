Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'mechanics#welcome'

  get '/mechanics/index', to: 'mechanics#index'
  get '/mechanics/:id', to: 'mechanics#show'

  get '/rides/new', to: 'rides#new'
  post '/mechanics/:id', to: 'rides#create'

end
