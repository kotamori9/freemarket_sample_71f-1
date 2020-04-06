class Item < ApplicationRecord
  # belongs_to :user
  # belongs_to :barand
  # belongs_to :category
  # has_many :purchased
  has_many :photos, dependent: :delete_all
  accepts_nested_attributes_for :photos, allow_destroy: true
  # 画像が0枚の時に出品できないようになっている
  validates_associated :photos
  validates :photos, presence: true

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

  # 税の定数を設定(税率を変えたい場合はこちらで変更願います。)
  Taxrate = 1.1

  # 引数の値段を消費税込みに変換して返します。
  # string型の引数である商品の値段と税率(to_sへの変換が必要)を、BigDecimalに変換して計算後、小数点以下を破棄に変更)
  def self.taxingPrice(a_price)
    if a_price.blank?
      return
    else
      a_price=(BigDecimal(a_price)*BigDecimal(Taxrate.to_s)).floor
      return a_price
    end
  end

  # 引数の値段を消費税抜きに変換して返します。
  def self.nonetaxingPrice(a_price)
    a_price=(BigDecimal(a_price)/BigDecimal(Taxrate.to_s)).floor
    return a_price
  end


  # アクティブハッシュ
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :statushash
  belongs_to_active_hash :postagehash
  belongs_to_active_hash :shippinghash
  belongs_to_active_hash :aprefecture
end


