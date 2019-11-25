class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_items

  validates :title, :price, :image_url, 
    presence: true
end
