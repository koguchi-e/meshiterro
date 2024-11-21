class Favorite < ApplicationRecord
  belong_to :user
  belong_to :post_image

  # 1人のユーザーが1つの投稿に対して重複していいねを押せないようにする
  # user_idとpost_image_idのペアが一意である（重複しない）状態に制限
  validates :user_id, uniqueness: {scope: :post_image_id}
end
