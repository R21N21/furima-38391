class ItemsController < ApplicationController

  def index
    # @items = Item.all
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

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_description, :item_price, :category_id,:item_condition_id, :preparation_day_id, :postage_payer_id, :prefecture_id).merge(user_id: current_user.id)
  end
end
