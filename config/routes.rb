Rails.application.routes.draw do

  devise_for :users
  root to: 'chats#index'
  resource :users, only: [:edit, :update]
  resource :chats, only: [:edit, :update, :new, :show, :create] do
    resources :messages, only: [:index, :create]
  end
end
