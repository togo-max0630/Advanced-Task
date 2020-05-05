Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
    resource :favorites, only:[:create, :destroy]
  end
  post 'books/:book_id/book_comments/' => 'book_comments#create', as: 'create_comment'
  delete 'books/:book_id/book_comments/:id' =>'book_comments#destroy',as: 'destroy_comment'

  root 'home#top'
  get 'home/about'
end
