class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show, :edit, :update]
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  before_action :buy_present_redirect, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_find
    @item = Item.find(params[:id])
  end

  def buy_present_redirect
    redirect_to root_path if current_user.id != @item.user.id || @item.buy.present?
  end

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :pay_id, :prefecture_id, :delivery_date_id, :price,
                                 :image).merge(user_id: current_user.id)
  end
end
