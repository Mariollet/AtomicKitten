class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  # def item_params
  #   params.require(:item).permit(:id, :image)
  # end

  def set_item
    @item = Item.find(params[:id])
  end
end
