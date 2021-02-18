Rails.application.routes.draw do
  get "/professors/:id", to: "professors#show"
end
