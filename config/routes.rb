Rails.application.routes.draw do

  devise_for :users
  root to: 'messages#index'
  resource :users, only: [:edit, :update]
  resource :chats, only: [:edit, :update, :new, :show, :create]
end
