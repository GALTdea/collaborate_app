Rails.application.routes.draw do
  resources :entries
  resources :challenges
  resources :users
  root to: "pages#welcome"
  get 'pages/welcome'
  get 'pages/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
