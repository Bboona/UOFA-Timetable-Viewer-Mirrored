Rails.application.routes.draw do
  resources :students
  resources :teachers
  resources :weeklies
  resources :activities
  root "logins#index"
  get "admins" => "admins#index"
  # get "admins" => "admins#index"
  post "admins" => "admins#set_restriction_level"
  # post "admins" => "admins#set_restriction_level"
  get "clashes" => "clashes#index"
  get "clashes" => "clashes#index"
  get "students" => "students#index"
  get "students/weekly/:id" => "students#weekly"
  get "teachers" => "teachers#index"
  get "meetings" => "teachers#add_meeting"
  get 'students/index'
  get 'admins/index'
  get 'teachers/index'
  get 'teachers/add_meeting'
  get "teachers/weekly/:id" => "teachers#weekly"
end