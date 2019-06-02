Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  resources :posts do
    resources :comments, only: %i[create update destroy]
    resources :likes, only: %i[create destroy]
  end

  # devise_for :users
end
