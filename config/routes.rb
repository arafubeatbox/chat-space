Rails.application.routes.draw do

  devise_for :users
  root to: 'chats#index'
  resources :users, only: [:edit, :update, :index]
  resources :chats, only: [:edit, :update, :new, :show, :create] do
    resources :messages, only: [:index, :create]
  end
end
