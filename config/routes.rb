Rails.application.routes.draw do
  root to: 'home#index'
  post '/', to: 'home#search'
  get '/list', to: 'home#list'
end
