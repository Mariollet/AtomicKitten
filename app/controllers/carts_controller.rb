class CartsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_cart, only: [:index, :edit, :update,:destroy]


  def index
    @global_amount = @cart.items.map {|item| item.price}.inject(0) {|sum, price| sum+price }
    @items = @cart.items
    end
    



  def create
  end

  def update
    @item = Item.find(params[:id])
    
    @additem = CartItem.new(item_id:@item.id, cart_id: @cart.id)
    
    if @additem.save # essaie de sauvegarder en base @gossip
      flash[:notice] = "Photo ajoutée au panier"    
      redirect_to '/items' # si ça marche, il redirige vers la page d'index du site
      
    else
      flash[:notice] = "échec"
      redirect_to item_path(@item.id)   # sinon, il render la view new (qui est celle sur laquelle on est déjà)
    end
  
 
  end

  def destroy
     
    @item_to_destroy= CartItem.find_by(item_id: params[:item_id],cart_id: @cart.id)
    
    @item_to_destroy.destroy 
      
    redirect_to carts_path

  end

  private

  # def cart_params
  #   params.require(:cart).permit(:user_id)
  # end

  def set_cart

    unless Cart.exists?(user_id: current_user.id)
      @cart = Cart.create(user_id: current_user.id)
    else 
      @cart = Cart.find_by(user_id: current_user.id)
    end
    
  end

  

end
