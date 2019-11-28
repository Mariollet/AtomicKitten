class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  def admin_send
    OrderMailer.order_send_admin_email(self).deliver_now
  end

  def bill_send
    OrderMailer.order_send_email(self).deliver_now
  end

end
