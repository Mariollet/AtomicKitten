class OrderController < ApplicationController
  protect_from_forgery
  def create
  #création de l'instance ORDER
  cart = Cart.find(params[:id])
  order = Order.new(user_id: cart.user_id
  ) 
  order.save

  #OrderItem
  # ajouter les items présent dans le cart
  orderid = order.id
  cart_id = cart.id
  user_id = cart.user_id
  

  #création de l'instance CARTITEM
  #récupérer item_id avec cart_id

    cartitems = CartItem.where cart_id: cart_id
    #boucle pour mettre les items dans order-items
      i=0
      while i < cartitems.length do 
          orderitem = OrderItem.new(item_id: cartitems[i].item_id,
            order_id: orderid,
          ) 
      orderitem.save
      i = i+1
      end
 
    cart.destroy

  end
end