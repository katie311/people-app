Rails.application.routes.draw do
  get 'notes/index'
  get 'notes/edit'
  get 'notes/show'
  get 'notes/new'
  root 'static_pages#home'
  
  get '/about', to: 'static_pages#about'
  
  get '/home', to: 'static_page#home'

  resources :people
end