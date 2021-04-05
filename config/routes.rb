Rails.application.routes.draw do
  # For details on the DSL available within this file, see http:
  get "/mechanics", to: 'mechanics#index'
  get "/mechanics/:id", to: 'mechanics#show'
end
