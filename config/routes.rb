Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/new', to: 'mechanics#new'
  post '/mechanics', to: 'mechanics#create'
  get '/mechanics/:id', to: 'mechanics#show'

end
