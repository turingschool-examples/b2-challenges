Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/professors/:id", to: "professors#show"
  get "/professors", to: "professors#index"
  get "/professors/:id/edit", to: "professors#edit", as: "professors_edit"
  patch "/professors/:id", to: "professors#update"

  patch "students/:id", to: "students#update", as: "students_update"
end
