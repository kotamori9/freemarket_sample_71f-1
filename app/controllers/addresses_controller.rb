class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
  end

  def zipedit
    params.require(:address).permit(:postal_code, :prefecture, :city, :address_number, :any_address_info)
  end
end
