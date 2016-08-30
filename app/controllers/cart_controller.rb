class CartController < ApplicationController

  def createSession

  end

  def add
    cookies[:user_id] = { item_id: params[:item_id], quantity: params[:quantity] }
  end

  def remove

  end


end
