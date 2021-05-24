Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :mechanics
  get "/mechanics/:id/ride_mechanics/new", to: "ride_mechanics#new"
end
