class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :category_id
    validates :status_id
    validates :pay_id
    validates :prefecture_id
    validates :delivery_date_id
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :pay_id
    validates :prefecture_id
    validates :delivery_date_id
  end

  validates :price, allow_blank: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :pay
  belongs_to :prefecture
  belongs_to :delivery_date
end
