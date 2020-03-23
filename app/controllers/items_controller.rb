class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      binding.pry
      redirect_to root_path(@item), flash[:notice] ='商品が出品されました'
    else
      # redirect_back(fallback_location: root_path), flash[:alert] ='商品が出品されました'
      redirect_to root_path
    end
  end
  
  def show
  end

  private
  def item_params
    params.require(:item).permit(:brand,:name,:description,:status,:shipping_charges,:days_to_ship,:buyer_id,:saler_id, image_attributes: [:id, :image],Category_attributes:[:id, :category_id])
  end

end