Rails.application.routes.draw do
  root to: 'home#index'
  post '/', to: 'home#search'
  get '/list', to: 'home#list', as: 'list'
  post '/list', to: 'home#maj'
end
