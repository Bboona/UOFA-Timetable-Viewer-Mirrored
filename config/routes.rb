Rails.application.routes.draw do
  get 'teachers/index'
  get 'students/index'
  root "tableviewer#index"
end