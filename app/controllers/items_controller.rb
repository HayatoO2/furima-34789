class ItemsController < ApplicationController
  def index
  end

  def new
    unless user_signed_in?
      redirect_to root_path
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :pay_id, :prefecture_id, :delivery_id, :price, :image).merge(user_id: current_user.id)
  end




end
