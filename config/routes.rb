Rails.application.routes.draw do
  resources :activities
  root "articles#index"
end