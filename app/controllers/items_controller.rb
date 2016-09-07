class ItemsController < ApplicationController

  def show
    @item = Item.find_by(id: params[:id])
  end

  def index
    @items = Item.all
  end

  def update

  end

  private

  def item_params
    param.require(:item).permit(:name, :description, :price, :quantity, :image, :discount, :category)
  end
end
