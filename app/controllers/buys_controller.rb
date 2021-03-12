class BuysController < ApplicationController

  def index
    
    @buy_address = BuyAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
  end
end
