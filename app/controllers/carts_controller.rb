class CartsController < ApplicationController
  respond_to :js

  def index
    get_cart

    rescue => e
      flash[:danger] = "Your cart is empty, add some items first!"
      redirect_to root_path
  end

  def get_cart
    items = JSON.parse(cookies[:cart])
    total_price= 0.0;
    @items = []

    items.each do |k,v|
      item = Item.find_by(id: k)

      subprice =0.0;
      subprice = item.price * v.to_f
      total_price += subprice

      item.define_singleton_method(:quantities) { v }
      item.define_singleton_method(:subprice) {subprice}

      @items << item
    end

    total_price(total_price)
    return @items
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

  def edit

  end

  def remove
    @items = JSON.parse(cookies[:cart])
    @items.delete(params[:id])

    if @items.empty?
      cookies.delete :cart
    else
      cookies[:cart] = JSON.generate(@items)
    end
    flash[:success] = "REMOVED items"
    redirect_to carts_path
  end

  private
  def cart_params
    params.require(:cart).permit(:quantity)
  end

  def total_price(total_price)
    @total_price = total_price
  end
end
