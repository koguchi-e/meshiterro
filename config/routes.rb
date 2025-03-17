Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'

  devise_for :admins, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
    resources :post_images, only: [:destroy]
    get 'homes/about', to: 'homes#about', as: 'admin_about'
  end

  scope module: :public do
    root to: "homes#top"
    get "homes/about", to: "homes#about"

    devise_for :users, controllers: {
      sessions: 'public/sessions'
    }

    resources :post_images, only: [:new, :create, :index, :show, :destroy] do
      resources :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end

    resources :users, only: [:show, :edit, :update]
  end
end
