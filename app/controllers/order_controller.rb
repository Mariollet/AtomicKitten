class OrderController < ApplicationController
  protect_from_forgery
  before_action :set_cart, only: [:create, :new]
  
  def new
  @amount = @cart.items.map {|item| item.price}.inject(0) {|sum, price| sum+price }
  @user = current_user
  end

  def create

    ###########STRIPE##################

    @amount = (@cart.items.map {|item| item.price}.inject(0) {|sum, price| sum+price })* 100

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],  
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount.to_i,
      description: 'Rails Stripe customer',
      currency: 'EUR',
    })
    

    ###########STRIPE END##############

  #création de l'instance ORDER
  cart = @cart
  order = Order.new(user_id: cart.user_id
  )
  order.save


  ##########MAIL#####################

    OrderMailer.order_send_admin_email(order).deliver_now
    OrderMailer.order_send_email(order).deliver_now

  ##########MAIL#####################


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

    flash[:notice] = "Merci de votre achat, un mail vous a était envoyé, à bientôt !" 
    redirect_to order_index_path    

    
    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to carts_path
      


  end

  def index
    
    @orders = []
    
    Order.all.each do |order|
      if (order.user_id == current_user.id)
      @orders << order
      end
    end  

    @order= Order.find_by(user_id: current_user.id)
    
   

    
    
  end

  def set_cart

    unless Cart.exists?(user_id: current_user.id)
      @cart = Cart.create(user_id: current_user.id)
    else
      @cart = Cart.find_by(user_id: current_user.id)
    end
    
  end
end
