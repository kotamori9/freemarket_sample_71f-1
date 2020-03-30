class Item < ApplicationRecord
  # belongs_to :user
  # belongs_to :barand
  # belongs_to :category
  # has_many :purchased
  has_many :photos, dependent: :delete_all
  accepts_nested_attributes_for :photos, allow_destroy: true
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
  belongs_to :category

  # バリテーション

  # 商品名が必須
  validates :name, presence: true
  # 商品の説明が必須
  validates :description, presence: true
  # 商品の状態についての情報が必須
  validates :status, presence: true
  # 配送料の負担についての情報が必須
  validates :shipping_charges, presence: true
  # 発送元の地域についての情報が必須
  validates :area, presence: true
  # 発送までの日数についての情報が必須
  validates :days_to_ship, presence: true
  # 価格についての情報が必須
  validates :price, presence: true
  # カテゴリーの情報が必須
  validates :category, presence: true


  # アクティブハッシュ
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :statushash
  belongs_to_active_hash :postagehash
  belongs_to_active_hash :shippinghash
  belongs_to_active_hash :Aprefecture
end


