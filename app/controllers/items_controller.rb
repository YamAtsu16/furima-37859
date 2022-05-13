class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, only: :edit
  before_action :find_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
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
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :image, :price, :category_id, :condition_id, :delivery_charge_id, :prefecture_id,
                                 :shipping_date_id).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])

    redirect_to root_path if current_user.id != @item.user_id
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
