Rails.application.routes.draw do

  devise_for :users
  root to: 'chats#index'
  resources :users, only: [:index, :edit, :update] #解答にはindexアクションが定義されていたが、用途不明。rails g devise:viewsで定義されたeditのビューをカリキュラムの回答の操作で消去しているため、新しくresourcesで定義し直している。
  resources :chats, only: [:edit, :update, :new, :show, :create] do
    resources :messages, only: [:index, :create]
  end
end
