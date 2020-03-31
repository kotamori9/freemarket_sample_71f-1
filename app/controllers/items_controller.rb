class ItemsController < ApplicationController
  # before_action :set_item, except: [:index, :new, :create]
  # before_action :set_item, only: [:edit, :show]

  require "payjp"
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
    if @item.save
      redirect_to @item, notice: "商品名「#{@item.name}」を登録しました"
    else
      redirect_back fallback_location: @item,
      flash: {
        item: @item,
        error_messages: @item.errors.full_messages
      }
    end
  end

  def show
    @item = Item.find(params[:id])
    @categories = Category.find(params[:id])
    @category = @item.category

    @aprefecture = Aprefecture.find(@item.area)
    @shipping = Shippinghash.find(@item.days_to_ship)
    @postagehash = Postagehash.find(@item.shipping_charges)

  end


  def edit
    @item = Item.find(params[:id])
    @photo = Photo.find_by_id(params[:id])

    # @category_parent_array = ["---"]
    # #データベースから、親カテゴリーのみ抽出し、配列化
    # Category.where(ancestry: nil).each do |parent|
    #     @category_parent_array << parent.name
    # end
    
    grandchild_category = @item.category
    child_category = grandchild_category.parent


    @category_parent_array = []
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
    end

    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end
    
  end
  
  def update

    @item = Item.find(params[:id])
    if @item.update(item_update_params)
    redirect_to root_path, notice: "商品名「#{@item.name}」を編集しました"
    
    else
      redirect_back fallback_location: @item,
      flash: {
        item: @item,
        error_messages: @item.errors.full_messages
      }
    end


  end


  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  # def purchase
  #   @item = Item.find(params[:id])

  #   card = Creditcard.where(user_id: current_user.id).first
  #   if card.blank?
  #     redirect_to action: "new"
  #   else
  #     Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
  #     # Payjp.api_key = Rails.application.credentials[:PAYJP_PRIVATE_KEY]
  #     customer = Payjp::Customer.retrieve(card.customer_id)
  #     @default_card_information = customer.cards.retrieve(card.card_id)
  #   end
  # end

  # def pay
  #   @item = Item.find(params[:id])
  #   card = Creditcard.where(user_id: current_user.id).first
  #   Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
  #   charge = Payjp::Charge.create(
  #     :amount => @item.price,
  #     :card => @card,
  #     # :card => card.customer.id,
  #     :currency => 'jpy',
  #   )
  #   redirect_to action: :done
  # end

  # def done
  # end
  
  private
  def item_params
    params.require(:item).permit(:brand,:name,:description,:status,:shipping_charges,:days_to_ship,:buyer_id,:saler_id,:price,:area, photos_attributes: [:image, :_destroy, :id]).merge(saler_id: current_user.id,category_id: params[:category_id])
  end

  def item_update_params
    params.require(:item).permit(:price,:area,:brand,:description,:status,:shipping_charges,:days_to_ship,:name,photos_attributes: [:image, :_destroy, :id]).merge(category_id: params[:category_id])
  end
  # def buy_params
  #   @item = Item.find(params[:id])
  # end

end

