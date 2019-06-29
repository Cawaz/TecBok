Rails.application.routes.draw do
  root to: 'posts#index'

  resources :posts do
    resources :comments, only: %i[create destroy]
    resources :likes, only: %i[create destroy]
  end

  devise_for :users, :controllers => {
      :registrations => 'users/registrations'
  }

  resources :users, only: %i[show]
end
