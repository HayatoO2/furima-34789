class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show, :edit, :update]

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
    item_find
  end

  def edit
    item_find
    redirect_to root_path if current_user.id != @item.user.id || @item.buy.present?
  end

  def update
    item_find
    @item.update(item_params)

    if @item.valid?
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_find
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :pay_id, :prefecture_id, :delivery_date_id, :price,
                                 :image).merge(user_id: current_user.id)
  end
end
