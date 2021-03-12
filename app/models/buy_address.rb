class BuyAddress
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :telephone, :post_num, :prefecture_id, :city, :house_num, :building, :buy_id

  with_options presence: true do
    validates :telephone
    validates :post_num
    validates :prefecture_id
    validates :city
    validates :house_num
    validates :user_id
    validates :item_id
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)

    Address.create(telephone: telephone, post_num: post_num, prefecture_id: prefecture_id, city: city, house_num: house_num, building: building, buy_id: buy.id)
  end
end