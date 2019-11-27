class OrderMailer < ApplicationMailer
  default from: 'no-reply@chaton-mignon.fr'
    

  def order_send_admin_email(order)
     #on récupère l'instance order pour ensuite pouvoir la passer à la view en @user
     @order_id = order.id
     puts @order_id
     
     @user_id = order.user_id
     @user = User.find(@user_id)
     
     #on définit une variable @url qu'on utilisera dans la view d’e-mail
     @url  = 'www.chaton-mignon.fr' 
 
     # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
     mail(to: "anthonyph34000@gmail.com", subject: 'Une nouvelle commande a été passée !')

  end

end