Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/professors', to: 'professors#index'
  get '/professors/:id', to: 'professors#show'
end
