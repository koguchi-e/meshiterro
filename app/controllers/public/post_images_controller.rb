class Public::PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    # current_user = ログイン中のユーザーの情報を取得できる便利な記述
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_image_path(@post_image)
    else
      render :new
    end
  end

  def index
    respond_to do |format|
      format.html do
        @post_images = PostImage.page(params[:page])
      end
      format.json do
        @post_images = PostImage.all
      end
    end
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
    params.require(:post_image).permit(:shop_name, :image, :caption, :address)
  end
end
