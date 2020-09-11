class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def item_params
    params.require(:message).permit(:image).merge(user_id: current_user.id)
  end
end
