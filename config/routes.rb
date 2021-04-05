Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :mechanics

  post '/mechanics/add_ride', to: 'mechanics#add_ride', as: 'new_mechanic_ride'
end
