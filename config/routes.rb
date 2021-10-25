Rails.application.routes.draw do
  # Put get 'teachers/add_meeting' here
  # to override resources :teachers
  get 'teachers/add_meeting'
  resources :students
  resources :teachers
  resources :weeklies
  resources :activities
  root "sessions#new"
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
  get "teachers/weekly/:id" => "teachers#weekly"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end