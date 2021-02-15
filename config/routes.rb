Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :professors, :students

  patch '/professors/:id', to: "professor_students#update"
  patch '/ps/professors/:id', to: "professors#destroy"
end
