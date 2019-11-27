class OrderMailer < ApplicationMailer
  default from: 'no-reply@chaton-mignon.fr'
    

  def order_send_admin_email(order)
     #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
     @order_id = order
     puts @order_id
     

     #on définit une variable @url qu'on utilisera dans la view d’e-mail
     @url  = 'http://chaton-mignon.fr/' 
 
     # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
     mail(to: "anthonyph34000@gmail.com", subject: 'Une nouvelle commande a été passée !')

  end

end
