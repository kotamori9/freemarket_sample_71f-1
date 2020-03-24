class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new
    @item.photos.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      # redirect_back(fallback_location: root_path), flash[:alert] ='商品が出品されました'
      redirect_to root_path
    end
  end
  
  def show
  end

  private
  def item_params
    params.require(:item).permit(:brand,:category,:name,:description,:status,:shipping_charges,:days_to_ship,:buyer_id,:saler_id,:price,:area, photos_attributes: [:image])
  end

end
