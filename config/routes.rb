Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  root 'music#index'
  get '/music' => 'music#index'
  post '/music' => 'music#create'
  get '/music/new' => 'music#new'
  get '/music/:id' => 'comment#new'
  post '/comment' => 'comment#create'
  get '/comment/:id/edit' => 'comment#edit'
  patch '/comment' => 'comment#update'
  delete '/comment/:id' => 'comment#destroy'  
end
