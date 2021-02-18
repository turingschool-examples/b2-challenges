Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/professors', to: 'professors#index'
  get '/professors/:id', to: 'professors#show', as: :professors_show
  get '/professors/:id/edit', to: 'professors#edit'
  patch '/professors/:id', to: 'professors#update'
end
