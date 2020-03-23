class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new
  end

  def show 
  #  @item = Item.find(params[:id])
  end

  def edit

  end


  def update

  end

  def destroy
    # item = Item.find(params[:id])
    # item.destroy

  end

end
