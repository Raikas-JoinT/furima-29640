class ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = Article.order("created_at DESC")
    @items = Item.all.order(id: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end

  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
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
    params.require(:item).permit(:image, :title ,:content ,:category_id ,:status_id ,:burden_id ,:area_id ,:day_id ,:price ).merge(user_id: current_user.id)
  end
end
