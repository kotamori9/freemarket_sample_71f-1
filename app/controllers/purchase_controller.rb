class PurchaseController < ApplicationController
  def index
    @buyitem = Item.find(params[:item_id])
    @address = Address.where(user_id: current_user.id).first
    card = Creditcard.where(user_id: current_user.id).first
    address = Address.where(user_id: current_user.id).first
    if card.blank?
      redirect_to new_user_creditcard_path(current_user)
    elsif address.blank?
      redirect_to new_user_address_path(current_user)
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Creditcard.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => Item.find(params[:item_id]).price,
    :customer => card.customer_id,
    :currency => 'jpy',
  )
    @item_buyer= Item.find(params[:item_id])
    @item_buyer.update( buyer_id: current_user.id)
  redirect_to action: 'done'
  end

end
