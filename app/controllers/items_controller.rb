class ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = Article.order("created_at DESC")
  end

  def new
    @item = Article.new
  end

  def edit
  end

  def create
    @items = Article.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title ,:text ,:category_id ,:status_id, :burden_id ,:area_id ,:day_id)
  end

  def item_params
    params.require(:message).permit(:image).merge(user_id: current_user.id)
  end
end
