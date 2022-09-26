class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]
  before_action :redirect, only: [:edit, :destroy]

  def index
     @items = Item.all.order(created_at: "DESC")
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

  def show
  end

  def edit
    if @item.user_id == current_user.id && @item.item_purchase.nil?
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def redirect
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :item_description, :item_price, :category_id,:item_condition_id, :preparation_day_id, :postage_payer_id, :prefecture_id).merge(user_id: current_user.id)
  end
end
