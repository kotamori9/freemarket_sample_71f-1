class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]

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

  def edit

  end
  
  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:brand,:category,:name,:description,:status,:shipping_charges,:days_to_ship,:buyer_id,:saler_id,:price,:area, photos_attributes: [:image, :_destroy, :id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
