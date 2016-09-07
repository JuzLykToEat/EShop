class OrdersController < ApplicationController

  def create2
    @items = get_cart

    @order = current_user.orders.create(total: @total_price)

    @items.each do |item|
      @order.ordered_items.create(item_id: item.id, quantity: item.quantities)
    end
    binding.pry
  end

  def create
    @items = get_cart

    @order = current_user.orders.create(total: @total_price)
    @ordered_items = []

    @items.each do |item|
      ordered_item = @order.ordered_items.new(item_id: item.id, quantity: item.quantities)
      @ordered_items << ordered_item
    end

    if @order.save
      flash[:success] = "order saved"
    end

    @ordered_items.each do |o|
      o.save
      flash[:success] = "SAVEDD"
    end

  end

  def get_cart
    items = JSON.parse(cookies[:cart])
    @total_price= 0.0;
    @items = []

    items.each do |k,v|
      item = Item.find_by(id: k)

      subprice = item.price * v.to_f
      @total_price += subprice

      item.define_singleton_method(:quantities) { v }
      item.define_singleton_method(:subprice) {subprice}
      @items << item
    end
    @total_price
    return @items
  end


end
