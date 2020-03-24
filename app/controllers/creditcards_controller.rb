class CreditcardsController < ApplicationController

  require "payjp"

  def new
    card = Creditcards.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def show
    card = Creditcards.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
end
