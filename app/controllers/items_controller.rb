class ItemsController < ApplicationController

  def show
    @item = Item.find_by(id: params[:id])
  end

  def index
    @items = Item.all
  end

  def add
    @item = Item.new(item_params)
  end

  def edit

  end

  def destroy

  end

  def update

  end

  private

  def item_params
    param.require(:item).permit(:name, :description, :price, :quantity, :image, :discount, :category)
  end
end
