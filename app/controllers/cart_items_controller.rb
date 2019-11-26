class CartItemsController < ApplicationController

def new
end

def create
  
  @cart = Cart.find_by(user_id: current_user.id)
  @cart_items = CartItem.new( cart_id: @cart.id,
                              item_id: params[:id]
                            )           
  
  if @cart_items.save # essaie de sauvegarder en base
      
      redirect_to '/' # si ça marche, il redirige vers la page d'index du site
  else
      render item_path(@cart_items.id)  # sinon, il render la view new (qui est celle sur laquelle on est déjà)
  end




end

def destroy
  @cart = Cart.find_by(user_id: current_user.id) 
  @cart_item = CartItem.find_by(cart_id: @cart.id)
  @cart_item.destroy 
    flash[:danger] = "L'item #{@cart_item.item.title} à bien été supprimmé"
    redirect_to cart_path(@cart.id)
end

  
