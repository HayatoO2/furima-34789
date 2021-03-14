class BuyAddress
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :telephone, :post_num, :prefecture_id, :city, :house_num, :building, :token

  with_options presence: true do
    validates :telephone, numericality: true, length: { maximum: 11 }
    validates :post_num, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }

    validates :city
    validates :house_num
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)

    Address.create(telephone: telephone, post_num: post_num, prefecture_id: prefecture_id, city: city, house_num: house_num,
                   building: building, buy_id: buy.id)
  end
end
