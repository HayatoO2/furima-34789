class ItemsController < ApplicationController
  def index
  end

  def new
    unless user_signed_in?
      redirect_to root_path
    end

    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    unless @item.save
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :pay_id, :prefecture_id, :delivery_date_id, :price, :image).merge(user_id: current_user.id)
  end




end
