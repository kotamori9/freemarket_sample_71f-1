class Item < ApplicationRecord
  # belongs_to :user
  # belongs_to :barand
  # belongs_to :category
  # has_many :purchased
  has_many :photos
  accepts_nested_attributes_for :photos, allow_destroy: true
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
  # belongs_to :category

  # アクティブハッシュ
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :statushash
  belongs_to_active_hash :postagehash
  belongs_to_active_hash :shippinghash

end


