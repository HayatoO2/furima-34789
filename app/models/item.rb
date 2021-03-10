class Item < ApplicationRecord


  belongs_to :user

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

  with_options numericality: {other_than: 1}, allow_blank: true do
    validates :category_id
    validates :status_id
    validates :pay_id
    validates :prefecture_id
    validates :delivery_date_id
  end

  validates :price, allow_blank: true, numericality:  { greater_than_or_equal_to: 300 }, numericality: { less_than_or_equal_to: 9999999 }

  has_one_attached :image






  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :pay
  belongs_to :prefecture
  belongs_to :delivery_date
end
