Rails.application.routes.draw do
<<<<<<< HEAD
  resources :teachers
  resources :weeklies
  resources :activities
  root "tableviewer#index"
  get "admins"  => "admins#index"
  post "admins" => "admins#set_restriction_level"
  get "clashes" => "clashes#index"
  get "week"    => "weeklies#index"
  get "teachers"=> "teachers#index"
  get "teachers/weekly/:id" => "teachers#weekly"
=======
  root "logins#index"
  get "admins" => "admins#index"
  post "admins" => "admins#set_restriction_level"
  get "clashes" => "clashes#index"
  get "students" => "students#index"
  get 'students/index'
  get 'admins/index'
  get 'teachers/index'
  get 'teachers/add_meeting'
>>>>>>> teacher_meeting
end