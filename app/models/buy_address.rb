class BuyAddress
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :telephone :post_num, :prefecture_id, :city, :house_num, :building, :buy_id
end