class FavoritesController < ApplicationController

  def create
    # PostImageテーブルから、いいねをしたい投稿（ID指定）を探してpost_imageに代入している
    post_image = PostImage.find(params[:post_image_id])
    # 現在ログインしているユーザー（current_user）のデータを基準に、新しいお気に入りを作成し、いいねをしたい投稿のIDを設定している
    favorite = current_user.favorites.new(post_image_id: post_image.id)
    favorite.save
    redirect_to post_image_path(post_image)
  end

  def destroy
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)
    favorite.destroy
    redirect_to post_image_path(post_image)
  end
  
end
