class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: :index
  before_action :move_to_index, only: :index

  def index
    @address = ItemBuy.new
  end

  def create
    @address = ItemBuy.new(address_params)
    if @address.valid?
      pay_item
      @address.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'index'
    end
  end

  private

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_9ec67429cb2f7da3c03bc967"
    Payjp::Charge.create(
      amount: @item.price,
      card: address_params[:token],
      currency:'jpy'
    )
  end

  def address_params
    params.permit(:token, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id || @item.addresses_item
      redirect_to root_path
    end
  end

end
