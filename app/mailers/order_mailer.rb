class OrderMailer < ApplicationMailer
  default from: 'no-reply@chaton-mignon.fr'
  def order_send_email(order) 
    #le nom de l'utilisateur
    
    @order_id = (Order.all.max_by(&:id).id + 1)
    @user_id = order.user_id
    @firstname = User.find(@user_id).first_name
    @lastname = User.find(@user_id).last_name
    @email = User.find(@user_id).email
    #url des items
    @cart_id = Cart.where user_id: @user_id
    #order
    @cartitems = CartItem.where cart_id: @cart_id
    @cartitems_length = @cartitems.length
    i=0
    @items_id_array = []
    while i < @cartitems_length do
      picture_id = @cartitems[i].item_id
      @items_id_array << picture_id
      i= i+1
    end
    puts @items_id_array
    
    i = 0
    @items_url_array = []

    while i < @cartitems_length do
      item_url = Item.find(@items_id_array[i]).image_url
      @items_url_array << item_url
      i= i+1
    end
    
    puts @items_url_array

    i = 0
    @items_url_price = []

    while i < @cartitems_length do
      item_price = Item.find(@items_id_array[i]).price
      @items_url_price << item_price
      i= i+1
    end
    puts @items_url_price
    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'www.chaton-mignon.fr' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @email, subject: 'Merci pour votre commande !') 
  end


  def order_send_admin_email(order)
    #on récupère l'instance order pour ensuite pouvoir la passer à la view en @user
    #le nom de l'utilisateur
    @order_id = (Order.all.max_by(&:id).id + 1)
    @user_id = order.user_id
    @firstname = User.find(@user_id).first_name
    @lastname = User.find(@user_id).last_name
    @email = User.find(@user_id).email
    #url des items
    @cart_id = Cart.where user_id: @user_id
    #order

    @cartitems = CartItem.where cart_id: @cart_id
    @cartitems_length = @cartitems.length
    i=0
    @items_id_array = []
    while i < @cartitems_length do
      picture_id = @cartitems[i].item_id
      @items_id_array << picture_id
      i= i+1
    end
    puts @items_id_array
    i = 0
    @items_url_array = []

    while i < @cartitems_length do
      item_url = Item.find(@items_id_array[i]).image_url
      @items_url_array << item_url
      i= i+1
    end
    
    puts @items_url_array

    i = 0
    @items_url_price = []

    while i < @cartitems_length do
      item_price = Item.find(@items_id_array[i]).price
      @items_url_price << item_price
      i= i+1
    end
    puts @items_url_price
    
    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'www.chaton-mignon.fr' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: "anthonyph34000@gmail.com", subject: 'Une nouvelle commande a été passée !')

  end
end