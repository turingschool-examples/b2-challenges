Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/mechanics', to: 'mechanic#index', as: 'mechanic_index'
  get '/mechanics/:id', to: 'mechanic#show', as: 'mechanic_show'
  post '/mechanics/:id/add_ride', to: 'mechanic#add_ride'

end
