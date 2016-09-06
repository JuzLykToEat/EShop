class CheckoutsController < ApplicationController
  before_action :get_total_price, :authenticate!

  def new
    @client_token = Braintree::ClientToken.generate
  end

  def create
    result = Braintree::Transaction.sale(
      amount: @total_price,
      payment_method_nonce: params[:payment_method_nonce],
      options: {
        submit_for_settlement: true
      }
    )

    if result.success?
      order = current_user.orders.create(total: result.transaction.amount)

      @items.each do |item|
        order.ordered_items.create(item_id: item.id, quantity: item.quantities)
        cookies.delete(:cart)
      end
      flash[:success] = "Paid!"
      redirect_to root_path
    else
      flash[:danger] = "Payment failed!"
      redirect_to root_path
    end

  end


  private

  def get_total_price
    @items = []
    @total_price = 0.00

    contents = JSON.parse(cookies[:cart])
    contents.each do |product_id, quantity|
      item = Item.find_by(id: product_id)

      item.define_singleton_method(:quantities) { quantity }
      @items << item
      @total_price += item.price * quantity.to_f
    end
  end
end
