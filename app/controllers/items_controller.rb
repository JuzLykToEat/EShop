class ItemsController < ApplicationController

  def show
    @item = Item.find_by(id: params[:id])
  end

  def index
    if params[:search] && params[:search].present?
      @items = Item.search params[:search]
    else
      @items = Item.all
    end
  end

  def update

  end

  private

  def item_params
    param.require(:item).permit(:name, :description, :price, :quantity, :image, :discount, :category)
  end
end
