class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_rootpath, only: :index

  def index
    @item = Item.find(params[:item_id])
    @buyer_order = BuyerOrder.new
  end

  def create
    @buyer_order = BuyerOrder.new(order_params)
    if @buyer_order.valid?
      pay_item
      @buyer_order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_params
    params.require(:buyer_order).permit(:postal_code, :municipalities, :address, :building, :tell, :prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_rootpath
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif Order.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end

  def pay_item
    item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_e7e6fd84dd55f6dde35af88d"
    Payjp::Charge.create(
      amount: item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
