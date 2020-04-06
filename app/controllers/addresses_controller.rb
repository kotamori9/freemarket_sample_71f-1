class AddressesController < ApplicationController

  def index
    # @addresses = Address.includes(:user)
    @addresses = Address.where(user_id: current_user.id)
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(adress_params)
    if @address.save
      redirect_to root_path, notice: '住所を登録しました'
    else
      render :new
    end
  end

  def edit
  end

  private
  def adress_params
    params.require(:address).permit(:destination_name, :destination_name_furigana, :postal_code, :prefecture, :city, :address_number, :any_address_info).merge(user_id: current_user.id)
  end
end
