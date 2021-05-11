Rails.application.routes.draw do
  devise_for :users
  
  root 'pages#index'
  get 'pages/show'

  #diary
  
  get '/home', to: 'children_diaries#home'
  get '/living', to: 'children_diaries#living'
  get '/health', to: 'children_diaries#health'
  get '/visit', to: 'children_diaries#visit'
  get '/information', to: 'children_diaries#information'
  
  get '/search', to: 'children_diaries#search'
  
  
  resources :children
  resources :children_diaries
  
  
  
end
