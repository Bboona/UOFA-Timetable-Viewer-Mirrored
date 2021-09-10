Rails.application.routes.draw do
  resources :students
  #root "tableviewer#index"
  root "logins#index"
  get "admins" => "admins#index"
  get "admins" => "admins#index"
  post "admins" => "admins#set_restriction_level"
  post "admins" => "admins#set_restriction_level"
  get "clashes" => "clashes#index"
  get "clashes" => "clashes#index"
  get "students" => "students#index"
  get 'students/index'
  get 'admins/index'
  get 'teachers/index'
  get 'teachers/add_meeting'
end