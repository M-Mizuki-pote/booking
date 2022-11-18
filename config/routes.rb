Rails.application.routes.draw do
  get 'posts/index'
  root "users#top"
  get "reservations/show" ,to: "reservations#show"
  get 'posts/:id' => 'posts#show'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get "posts/new/:post_id", to: 'posts#new', as: :new_post

  devise_for :users
  resources :users
  resources :posts
  resources :reservations
 end
