class Delivery_charge < ActiveHash::Base
  include ActiveHash::Associations
  has_many :items
end