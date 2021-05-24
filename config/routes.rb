Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'application#welcome'

  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/new', to: 'mechanics#new'
  get '/mechanics/:id', to: 'mechanics#show'
  post '/mechanics', to: 'mechanics#create'
  get '/mechanics/:id/edit', to: 'mechanics#edit'
  patch '/mechanics/:id', to: 'mechanics#update'
  delete '/mechanics/:id', to: 'mechanics#destroy'

end
