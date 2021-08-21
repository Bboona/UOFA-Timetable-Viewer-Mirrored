Rails.application.routes.draw do
  root "tableviewer#index"
  get "admins" => "admins#index"
  post "admins" => "admins#set_restriction_level"
end