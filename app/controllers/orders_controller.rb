class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    if user_signed_in?
      redirect_to("/items/#{:id}")
    else
      redirect_to("users/sign_in")
    end
  end

  def create
    @address = Item.new(price: address_params[:price])
    if @address.valid?
      pay_item
      @address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def address_params
    params.permit(:token, :postal_code, :prefecture, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_9ec67429cb2f7da3c03bc967"
    Payjp::Charge.create(
      amount: address_params[:price],
      card: address_params[:token],
      currency:'jpy'
    )
  end

end
