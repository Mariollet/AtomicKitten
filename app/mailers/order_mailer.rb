class OrderMailer < ApplicationMailer
  default from: 'no-reply@chaton-mignon.fr'
    
  def order_send_email(order)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = order.user_id
    #puts @user
    @email = User.find(@user).email
    @firstname = User.find(@user).first_name

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://chaton-mignon.fr/' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @email, subject: 'Merci pour votre achat !') 
  end

end