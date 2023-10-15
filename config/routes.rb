Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :books do
    resources :likes, only: [:create, :destroy]
    resources :wants, only: [:create, :destroy]
    resources :comments
    resources :results
    
  end

  resources :perfumes


    root 'books#index'

  get "books/:id/success" => "books#success", as:"success_book"
  get "books/:book_id/likes" => 'likes#create'
  get "books/:book_id/likes/:id" => 'likes#destroy'

  get "books/:book_id/wants" => 'wants#create'
  get "books/:book_id/wants/:id" => 'wants#destroy'

  post 'perfumes/:num' => 'perfumes#result'


end


