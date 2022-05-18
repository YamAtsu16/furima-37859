class BuyerOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :municipalities, :address, :building, :tel, :prefecture_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :tel, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :municipalities, :address, :user_id, :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Buyer.create(postal_code: postal_code, municipalities: municipalities, address: address, building: building, tel: tel, prefecture_id: prefecture_id, order_id: order.id )
  end
end