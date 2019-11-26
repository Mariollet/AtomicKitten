class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependant: :destroy
  has_many :items, through: :cart_items
end
