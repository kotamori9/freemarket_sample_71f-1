class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :item
  # 画像が0枚の時に出品できないようになっている
  validates :image, presence: true
end
