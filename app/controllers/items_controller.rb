class ItemsController < ApplicationController
  respond_to :js

  def show
    @item = Item.find_by(id: params[:id])
  end

  def index
    params[:category] ||= ["T-Shirt", "Jacket", "Cap", ""]
    if params[:search] && params[:search].present?
      @items = Item.search(params[:search],
        where: { category: params[:category] })
    else
      @items = Item.where(category: params[:category])
    end
  end

  def update

  end

  private

  def item_params
    param.require(:item).permit(:name, :description, :price, :quantity, :image, :discount, :category)
  end
end
