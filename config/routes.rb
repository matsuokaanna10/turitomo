Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    post 'guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
  scope module: :public do
    root to: 'homes#top'
   resources :users, only: [:show, :edit, :update]
   resources :bulletin_boards, only: [:new, :index, :show, :create, :edit, :update]
   resources :comments, only: [:new, :create]
   resources :recruitments, only: [:new, :show, :edit, :create, :update]
   resources :likes, only: [:create, :destroy]
   resource :relationships, only: [:create, :destroy]
   get 'followings' => 'relationships#followings', as: 'followings'
   get 'followers' => 'relationships#followers', as: 'followers'
  end
end
