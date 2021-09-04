Rails.application.routes.draw do
  resources :weeklies
  resources :activities
  root "tableviewer#index"
  get "admins"  => "admins#index"
  post "admins" => "admins#set_restriction_level"
  get "clashes" => "clashes#index"
  get "week"    => "weeklies#index"
  get "teachers"=> "teachers#index"
  get "teachers/weekly/:id" => "teachers#weekly"
end