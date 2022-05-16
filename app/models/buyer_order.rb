class BuyerOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :municipalities, :address, :building, :tell, :prefecture_id, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :tell, format: {with: /\A[0-9]{11}\z/}
    validates :prefecture_id, numericality: {other_than: 0}
    validates :municipalities, :address, :user_id, :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Buyer.create(postal_code: postal_code, municipalities: municipalities, address: address, building: building, tell: tell, prefecture_id: prefecture_id, order_id: order.id )
  end
end