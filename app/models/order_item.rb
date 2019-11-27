class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  after_create :bill_send

  def bill_send
    OrderItemMailer.order_send_email(self).deliver_now
  end
end
