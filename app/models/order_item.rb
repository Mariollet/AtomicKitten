class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  after_create :bill_send
  after_create :admin_send

  def admin_send
    OrderItemMailer.order_send_admin_email(self).deliver_now
  end

  def bill_send
    OrderItemMailer.order_send_email(self).deliver_now
  end
end
