Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
 
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy] 
  end

  devise_for :users
  root to: "homes#top"
  get "homes/about", to: "homes#about", as: "about"

  # resources メソッドは、ルーティングを一括して自動生成してくれる機能
  # 本当はdestroy(投稿削除)、update(投稿更新)、create(投稿作成)も作成されるが
  # onlyオプションを使用することで、生成するルーティングを限定している
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorite, only: [:create, :destroy]
    # 投稿画像に対してコメントされるため、post_commentsは、post_imagesに結びつける
    # 親子関係になる
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only:[:show, :edit, :update]
end
