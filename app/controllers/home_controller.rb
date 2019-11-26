class HomeController < ApplicationController
  
  def index
    @items = Item.first(7)
  end

  def team

  end

  def contact

  end
  
end
   