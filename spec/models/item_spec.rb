require 'rails_helper'

RSpec.describe Item, type: :model do
    # 商品名がなければ無効な状態であること
  it "is invalid without a name" do
    item = Item.new(name: nil)
    item.valid?
    expect(item.errors[:name]).to include("を入力してください")
  end

    # 商品の説明がなければ無効な状態であること
  it "is invalid without a description" do
    item = Item.new(description: nil)
    item.valid?
    expect(item.errors[:description]).to include("を入力してください")
  end 

    #  商品の状態についての情報がなければ無効な状態であること
    it "is invalid without a status" do
      item = Item.new(status: nil)
      item.valid?
      expect(item.errors[:status]).to include("を入力してください")
    end

    #  配送料の負担についての情報がなければ無効な状態であること
    it "is invalid with a shipping_charges" do
      item = Item.new(shipping_charges: nil)
      item.valid?
      expect(item.errors[:shipping_charges]).to include("を入力してください")
    end

    #  発送元の地域についての情報がなければ無効な状態であること
    it  "is invalid with a area" do
      item = Item.new(area: nil)
      item.valid?
      expect(item.errors[:area]).to include("を入力してください")
    end

    #  発送までの日数についての情報がなければ無効な状態であること
    it "is invalid with a days_to_ship" do
      item = Item.new(days_to_ship: nil)
      item.valid?
      expect(item.errors[:days_to_ship]).to include("を入力してください")
    end

    #  価格についての情報がなければ無効な状態であること
    it "is invalid with a price" do
      item = Item.new(price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end


    # # 画像が0枚の時に出品できないようになっている
    # it "is invalid with a photos" do
    #   item = Item.new(photos: nil)
    #   item.valid?
    #   expect(item.errors[:photos]).to include("を入力してください")
    # end

end