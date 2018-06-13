Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  get 'posts/index'
  get 'users/new'
  
  resources :users, only: [:index, :show, :edit, :update]
  resources :posts, exception: [:show] do
    post "/like", to: "likes#like_toggle"
    resources :comments, only: [:create, :destroy]
  end
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
