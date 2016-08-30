class ItemsController < ApplicationController

  def show
    @item = Item.find_by(id: params[:id])
  end

  def index
    @item = Item.new(name: "a", description: "desc", price: 20.8, quantity: 4)
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
