class Item < ApplicationRecord


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :pay
  belongs_to :prefecture
end
