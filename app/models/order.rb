class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items
  # after_create :bill_send
  # after_create :admin_send

  def admin_send
    OrderMailer.order_send_admin_email(self).deliver_now
  end

  def bill_send
    OrderMailer.order_send_email(self).deliver_now
  end

end
