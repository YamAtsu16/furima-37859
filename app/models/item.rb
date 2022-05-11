class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shipping_date

  belongs_to :user
  has_one_attached :image

  validates :name, :text, :price, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :shipping_date_id, presence: true
  validates :price, format: { with: /\A[0-9]+\z/ }, numericality: {in: 300..9999999}

end
