class OrderedItemsController < ApplicationController

  def create
    @cart = OrderedItems.new(cart_params.merge(params[:item_id]))

  end

  def index

  end

  private
  def cart_params
    params.require(:cart).permit(:item_id,:user_id,:quantity)
  end

end
