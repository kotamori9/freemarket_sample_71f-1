class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new
  end

  
  def show
  end

  private
  def item_params
    params.require(:item).permit(:brand,:category,:name,:description,:status,:shipping_charges,:days_to_ship,:buyer_id,:saler_id)
  end

end