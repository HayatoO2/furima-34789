class Buy < ApplicationRecord

  validates :user, presence: true
  validates :item, presence: true

end
