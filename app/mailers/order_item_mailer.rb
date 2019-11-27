class OrderItemMailer < ApplicationMailer

  def order_send_email(orderitem) 
    #le nom de l'utilisateur
    puts orderitem
    @picture_id = orderitem.item_id
    @item_url = Item.find(@picture_id).image_url
    
    puts @item_url

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://chaton-mignon.fr/' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: "unknown", subject: 'Merci pour votre achat !') 
  end

end
