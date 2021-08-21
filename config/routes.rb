Rails.application.routes.draw do
<<<<<<< HEAD
  resources :activities
  root "articles#index"
=======
  get 'admins/index'
  get 'teachers/index'
  get 'students/index'
  root "tableviewer#index"
>>>>>>> origin/main_page
end