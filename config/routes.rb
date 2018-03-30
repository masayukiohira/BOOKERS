Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:index, :show ,:edit, :update]
  root "users#top"
  get '/about' => 'posts#about'
  resources :posts
end
