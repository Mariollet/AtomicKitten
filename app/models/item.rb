class Item < ApplicationRecord
  validates :title, :price, :image_url, 
    presence: true
end
