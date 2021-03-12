class BuyAddress
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :telephone :post_num, :prefecture_id, :city, :house_num, :building, :buy_id

  with_options presence: trure do
    validates :telephone
    validates :post_num
    validates :prefecture_id
    validates :city
    validates :house_num
    validates :buy
    validates :user_id
    validates :item_id
  end
end