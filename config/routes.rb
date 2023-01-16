Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  devise_scope :user do
    post 'guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    root to: 'homes#top'
   resources :users, only: [:show, :edit, :update]
   resources :bulletin_boards, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
     resources :likes, only: [:create, :destroy]
   end
   resources :comments, only: [:create]
   resources :recruitments, only: [:new, :show, :edit, :create, :update]
   resources :relationships, only: [:create, :destroy]
   get 'followings' => 'relationships#followings', as: 'followings'
   get 'followers' => 'relationships#followers', as: 'followers'
  end

  namespace :admin do
  end
end
