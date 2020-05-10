Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update,:search] do
  end
  get "search" => "users#search"
  resources :books do
    resource :favorites, only:[:create, :destroy]
  end
  post 'books/:book_id/book_comments/' => 'book_comments#create', as: 'create_comment'
  delete 'books/:book_id/book_comments/:id' =>'book_comments#destroy',as: 'destroy_comment'
  
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す

  root 'home#top'
  get 'home/about'
  get 'relationships/FollowandFollower'
end
