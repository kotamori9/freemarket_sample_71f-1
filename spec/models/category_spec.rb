require 'rails_helper'

RSpec.describe Category, type: :model do

    # カテゴリーの情報がなければ無効な状態であること
    # it "is invalid with a category" do
    #   category = Category.new(name: nil)
    #   category.valid?
    #   expect(category.errors[:name]).to include("can't be blank")
    # end

end
