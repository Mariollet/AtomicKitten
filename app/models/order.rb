class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  before_create :bill_send
  before_create :admin_send

  def admin_send
    OrderMailer.order_send_admin_email(self).deliver_now
  end

  def bill_send
    OrderMailer.order_send_email(self).deliver_now
  end

end
