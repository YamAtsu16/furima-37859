class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shipping_date

  belongs_to :user
  has_one_attached :image

  validates :name, :text, :image, :price, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :shipping_date_id, presence: true
  validates :price, format: { with: /\A[0-9]+\z/ }, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :shipping_date_id, numericality: { other_than: 1, message: "can't be blank" }
end
