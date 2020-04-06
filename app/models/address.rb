class Address < ApplicationRecord

  include JpPrefecture
  jp_prefecture :prefecture,method_name: :pref

  validates :user_id,                    presence: true
  validates :destination_name,           presence: true
  validates :destination_name_furigana,  presence: true
  validates :postal_code,                presence: true
  validates :prefecture,                 presence: true
  validates :city,                       presence: true
  validates :address_number,             presence: true

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
  
  belongs_to :user

  # アクティブハッシュ用
  extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :Aprefecture
end
