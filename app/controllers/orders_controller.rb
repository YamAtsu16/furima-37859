class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_rootpath, only: :index
  before_action :find_item, only: [:index, :create, :move_to_rootpath, :pay_item]

  def index
    find_item
    @buyer_order = BuyerOrder.new
  end

  def create
    @buyer_order = BuyerOrder.new(order_params)
    if @buyer_order.valid?
      pay_item
      @buyer_order.save
      redirect_to root_path
    else
      find_item
      render :index
    end
  end

  private

  def order_params
    params.require(:buyer_order).permit(:postal_code, :municipalities, :address, :building, :tel, :prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_rootpath
    find_item
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif Order.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end

  def pay_item
    find_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

end
