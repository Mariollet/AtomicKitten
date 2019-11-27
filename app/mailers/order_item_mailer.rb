class OrderItemMailer < ApplicationMailer

  def order_send_email(orderitem) 
    #le nom de l'utilisateur
    @order_id = orderitem.order_id
    @user_id = Order.find(@order_id).user_id
    @firstname = User.find(@user_id).first_name
    @lastname = User.find(@user_id).last_name
    @email = User.find(@user_id).email
    #url de l'item
    @picture_id = orderitem.item_id
    @item_url = Item.find(@picture_id).image_url
    @item_price = Item.find(@picture_id).price

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'www.chaton-mignon.fr' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @email, subject: 'Merci pour votre commande !') 
  end


  def order_send_admin_email(orderitem)
    #on récupère l'instance order pour ensuite pouvoir la passer à la view en @user
    @order_id = orderitem.order_id
    puts @order_id
    order = Order.find(@order_id)
    
    @user_id = order.user_id
    @user = User.find(@user_id)

    @picture_id = orderitem.item_id
    @item_url = Item.find(@picture_id).image_url
    @item_price = Item.find(@picture_id).price
    
    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'www.chaton-mignon.fr' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: "anthonyph34000@gmail.com", subject: 'Une nouvelle commande a été passée !')

 end

end
