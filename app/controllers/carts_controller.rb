class CartsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_cart, only: [:show, :edit, :update]

  def index

    @global_amount = @cart.items.map {|item| item.price}.inject(0) {|sum, price| sum+price }
    @items = @cart.items

  end

  def edit
  end

  def create
  end

  def update
    
 
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
