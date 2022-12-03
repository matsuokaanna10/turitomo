Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :public do
    root to: 'homes#top'
    #post 'guest_sign_in', to: 'sessions#guest_sign_in'
   resources :users, only: [:show, :edit, :update]
   resources :bulletin_boards, only: [:new, :index, :show, :create, :edit, :update]
   resources :comments, only: [:new, :create]
   resources :recruitments, only: [:new, :show, :edit, :create, :update]
  end
end
