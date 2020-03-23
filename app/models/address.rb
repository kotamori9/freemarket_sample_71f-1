class Address < ApplicationRecord

  include JpPrefecture
  jp_prefecture :prefecture,method_name: :pref

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
  
  belongs_to :user
end
