class BuysController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @buy_address = BuyAddress.new
    @item = Item.find(params[:item_id])

    redirect_to root_path if current_user.id == @item.user.id
  end

  def create
    @buy_address = BuyAddress.new(buy_address_params)
    @item = Item.find(@buy_address.item_id)

    if @buy_address.valid?

      pay_item
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_address_params
    params.require(:buy_address).permit(:telephone, :post_num, :prefecture_id, :city, :house_num, :building).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_address_params[:token],
      currency: 'jpy'
    )
  end
end
