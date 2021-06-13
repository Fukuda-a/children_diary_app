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
  get '/pdf', to: 'post_pdf#index'
  get '/home_pdf', to: 'post_pdf#home'
  
  get '/diary_search', to: 'children_diaries#index'
  
  get 'pdf', to: 'post_pdf#index'
  
  
  resources :children
  resources :children_diaries
  resources :post_pdf, only: :index
  
end
