class Address < ApplicationRecord
  belongs_to :user

  # アクティブハッシュ用
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
