Rails.application.routes.draw do
  get 'admins/index'
  get 'teachers/index'
  get 'students/index'
  root "tableviewer#index"
end