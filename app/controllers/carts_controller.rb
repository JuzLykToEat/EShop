class CartsController < ApplicationController
  respond_to :js

  def show
    items = JSON.parse(cookies[:cart])
    total_price = 0.0;
    @items = []
    items.each do |product_id, quantity|
      item = Item.find_by(id: product_id)

      item.define_singleton_method(:quantities) { quantity }
      total_price += item.price * quantity.to_f
      @items << item
    end

    total_price(total_price)
  end

  def add
    if !cookies[:cart] #checks if an existing cart exists
      items = { params[:item_id] => cart_params[:quantity] }
    else
      items = JSON.parse(cookies[:cart])
      items[params[:item_id]] = cart_params[:quantity]
    end

    cookies[:cart] = JSON.generate(items)
  end

  def remove

  end


  private
  def cart_params
    params.require(:cart).permit(:quantity)
  end

  def total_price(total_price)
    @total_price = total_price
  end
end
