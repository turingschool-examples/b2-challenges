Rails.application.routes.draw do

  get "/professors", to: "professors#index"
  get "/professors/:id", to: "professors#show"
  get "/professors/:id/edit", to: "professors#update"
end
