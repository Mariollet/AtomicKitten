class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :category_items, dependent: :destroy
  has_many :categories, through: :category_items

  has_one_attached :image

  validates :title, :price, :image_url, 
    presence: true
end
