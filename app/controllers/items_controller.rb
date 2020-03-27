class ItemsController < ApplicationController
  # before_action :set_item, except: [:index, :new, :create]
  # before_action :set_item, only: [:edit, :show]

  def index
    @items = Item.all
    @photos = Photo.all
  end

  def new
    @item = Item.new
    @item.photos.new
    # @photos = @item.photos.build

      #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
    end
  end
  

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    @item = Item.new(item_params)
    # binding.pry
    if @item.save
      redirect_to @item, notice: "商品を登録しました"
      
      # redirect_to root_path(@item), notice: "商品が出品されました。"
    else
      # redirect_back(fallback_location: root_path), flash[:alert] ='商品が出品されました'
      redirect_to root_path, notice: "商品を登録に失敗しました"
    end
  end

  def edit
    @item = Item.find(params[:id])
    @photo = Photo.find(params[:id])

    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
    end
    # @photo = Photo.find(params[:id])
  end
  
  def update
    # if @item.update(item_params)
    #   redirect_to root_path
    # else
    #   render :edit
    # end

    @item = Item.find(params[:id])
    @item.update(item_update_params)
  end

  def show
    @item = Item.find(params[:id])
    @categories = Category.find(params[:id])

    # @items = Item.all.includes(:users)
  end

  private
  def item_params
    params.require(:item).permit(:brand,:name,:description,:status,:shipping_charges,:days_to_ship,:buyer_id,:saler_id,:price,:area, photos_attributes: [:image, :_destroy, :id]).merge(saler_id: current_user.id,category_id: params[:category_id])
  end

  # def set_item
  #   # @item = Item.find(params[:id])
  # end

  def item_update_params
    params.require(:item).permit(:name,[photos_attributes: [:image, :_destroy, :id]])
  end

end
