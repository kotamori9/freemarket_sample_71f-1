class ItemsController < ApplicationController
  # before_action :set_item, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren]

  def index
  end

  def new
    @item = Item.new
    @item.photos.new

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
    params.require(:item).permit(:brand,:category,:name,:description,:status,:shipping_charges,:days_to_ship,:price,:area, 
      photos_attributes: [:image, :_destroy, :id])
  end

  # def set_item
  #   @item = Item.find(params[:id])
  # end

end
