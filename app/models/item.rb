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
end
