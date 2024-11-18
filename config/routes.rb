Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"

  # resources メソッドは、ルーティングを一括して自動生成してくれる機能
  # 本当はdestroy(投稿削除)、update(投稿更新)、create(投稿作成)も作成されるが
  # onlyオプションを使用することで、生成するルーティングを限定している
  resources :post_images, only: [:new, :index, :show]

  get "homes/about", to: "homes#about", as: "about"
end
