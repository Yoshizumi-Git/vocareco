Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  root 'music#index'
  get 'music' => 'music#index'
  post 'music' => 'music#create'
  get 'music/new' => 'music#new'
end
