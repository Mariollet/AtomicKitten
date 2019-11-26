class HomeController < ApplicationController
  
  def index
    @items = Item.first(7)
  end

end
   