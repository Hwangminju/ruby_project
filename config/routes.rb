Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  get 'posts/index'
  get 'users/new'
  get 'users/index'
  
  resources :users, only: [:index, :show, :edit, :update]
  
  resources :posts, exception: [:show] do
    post "/like", to: "likes#like_toggle"
    resources :comments, only: [:create, :destroy]
  end
  
  scope module: :users do
    resources :relationships, only: [:create, :destroy] #팔로우/언팔로우시 처리로직 (화면설계 5에 해당)
  end
  
  resources :users do
    scope module: :users do
      resources :top, only: [:index], as: "top", path: "" # 프로필 페이지TOP (화면설계 1,3,4에해당)
      resources :followers, only: [:index] # Follower일람 페이지 (화면설계 2에해당)
      resources :followings, only: [:index] # Following일람 페이지 (화면설계 2에해당)
    end
  end
  
  post ':id/follow_user', to: 'relationships#follow_user', as: :follow_user 
  post ':id/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user
  get ':id', to: 'profiles#show', as: :profile 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
