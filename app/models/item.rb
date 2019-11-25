class Item < ApplicationRecord
  validates :title, :description, :price, :image_url, 
    presence: true
end
