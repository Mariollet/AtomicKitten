class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  
  after_create :bill_send

  def bill_send
    OrderMailer.order_send_email(self).deliver_now
  end

end
