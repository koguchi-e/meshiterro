class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    # current_user = ログイン中のユーザーの情報を取得できる便利な記述
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to "/post_images"
  end

  def edit
  end

  private

  # フォームで入力されたデータが、投稿データとして許可されているパラメータかどうかをチェック
  # 応用・10章
  def post_image_params
    # PostImageモデルへ保存した後、投稿一覧画面へリダイレクト
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
