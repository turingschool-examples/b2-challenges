Rails.application.routes.draw do
  get '/', to: 'welcome'
  get '/professors/:id', to: 'professors#show'
end
