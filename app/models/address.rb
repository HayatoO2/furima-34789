class Address < ApplicationRecord

  with_options presence: trure do
    validates :telephone
    validates :post_num
    validates :prefecture_id
    validates :city
    validates :house_num
    validates :buy
  end
end
