class OrderedItemsController < ApplicationController

  def create


  end

  private
  def cart_params
    params.require(:cart).permit(:item_id,:user_id,:quantity)
  end

end
