Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  get "/students", to: "students#index"
  get "/students/:id", to: "students#show", as: :students_show



  get '/professors', to:'professors#index'
  get '/professors/new', to:'professors#new'
  post '/professors', to:'professors#create'
  get '/professors/:id', to:'professors#show'
  get '/professors/:id/edit', to: 'professors#edit'
  patch '/professors/:id', to: 'professors#update'
  delete '/professors/:id', to: 'professors#destroy'

end
