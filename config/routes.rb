Rails.application.routes.draw do
  root "logins#index"
  get "admins" => "admins#index"
  post "admins" => "admins#set_restriction_level"
  get "clashes" => "clashes#index"
  get "students" => "students#index"
  get 'students/index'
  get 'admins/index'
  get 'teachers/index'
end