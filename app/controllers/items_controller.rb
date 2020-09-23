class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]

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
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def edit
  end

  def show
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

  def set_item
    @item = Item.find(params[:id])
  end
end
