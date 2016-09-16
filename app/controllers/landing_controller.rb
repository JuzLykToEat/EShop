class LandingController < ApplicationController
  def index
    @items = Item.order(id: :desc).limit(3)
  end

end
