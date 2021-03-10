class Item < ApplicationRecord

  with_options presence: true do 
    validates :name
    validates :text
    validates :category_id
    validates :status_id
    validates :pay_id
    validates :prefecture_id
    validates :delivery_date_id
    validates :price
  end

  with_options numericalit: {other_than: 1} do
    validates :category_id
    validates :status_id
    validates :pay_id
    validates :prefecture_id
    validates :delivery_date_id
  end






  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :pay
  belongs_to :prefecture
  belongs_to :delivery_date
end
