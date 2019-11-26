class OrderController < ApplicationController

  def create
  order = Order.new(user_id: user.id
  ) 
  order.save 
  end

end
