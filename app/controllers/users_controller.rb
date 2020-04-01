class UsersController < ApplicationController
  def show
    @users = User.find(current_user.id)

    @items = Item.where(saler_id: current_user.id)

  end
end
