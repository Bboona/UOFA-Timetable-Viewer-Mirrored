Rails.application.routes.draw do
  root "logins#index"
  get 'admins/index'
  get 'teachers/index'
  get 'students/index'
  get 'admins/login'
  get 'teachers/login'
  get 'students/login'
  get 'teachers/add_meeting'
  get "admins" => "admins#index"
  post "admins" => "admins#set_restriction_level"
end