Rails.application.routes.draw do

  root 'top_pages#home'
  get '/index',     to: 'top_pages#home'
  get '/help',      to: 'top_pages#help'
  get '/about',     to: 'top_pages#about'
  get '/contact',   to: 'top_pages#contact'

  get '/signup',    to: 'users#new'
  post '/signup',   to: 'users#create'
  get '/users/:id', to: 'users#show'

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
