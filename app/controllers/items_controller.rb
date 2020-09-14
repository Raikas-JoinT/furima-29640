class ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = Article.order("created_at DESC")
    @items = Item.all.order(id: "DESC")
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

  def checked
    item = Item.find(params[:id])
    if item.checked 
      item.update(checked: false)
    else
      item.update(checked: true)
    end

    item_post = Item.find(params[:id])
    render json: { item: item_post }
  end

  private

  def item_params
    params.require(:item).permit(:title ,:text ,:category_id ,:status_id, :burden_id ,:area_id ,:day_id, )
  end

  def item_params
    params.require(:message).permit(:image).merge(user_id: current_user.id)
  end
end
