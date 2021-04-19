Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1, format: 'json' do    
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations'
      }
      get 'isLike', to: 'post_likes#isLike'
      get 'allpost', to: 'posts#allpost'
      get 'new_post', to: 'posts#new_post'
      get 'new_plan_post', to: 'posts#new_plan_post'
      resources :posts, only: %i[index show create update destroy] do
        get :search, on: :collection
      end
      resources :users, only: %i[index show destroy] do
        get :search, on: :collection
      end
      resources :reviews, only: %i[index create update destroy]
      resources :menus, only: %i[index create update destroy]
      resources :recommends, only: %i[index create destroy]
      resources :pickups, only: %i[index create destroy]
      resources :choise_menus, only: %i[create update destroy]
      resource :relationships, only: %i[create destroy]
      resource :post_likes, only: %i[create destroy]
      resource :review_likes, only: %i[create destroy]
    end
  end
end
