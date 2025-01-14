Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  root "feed#show"

  resources :follows, only: [ :index, :create, :destroy ]

  resources :users, only: [ :index, :destroy ]
  get "follow" => "users#index"

  resources :likes, only: [ :create, :destroy ]

  resources :profiles, only: [ :show, :edit, :update ] do
    member do
      delete "delete_image/:image_id", action: "delete_image", as: "delete_image"
    end
  end

  resources :posts, except: [ :index, :show ] do
    resources :comments, only: [ :new, :create, :edit, :update, :destroy ]
  end

  resources :image_posts, only: [ :new, :create, :edit, :update, :destroy ] do
    resources :comments, only: [ :new, :create, :edit, :update, :destroy ]
  end

  resource :feed, only: :show

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
