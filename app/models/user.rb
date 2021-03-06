class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buys

  with_options presence: true do
    validates :nickname
    validates :last_name
    validates :first_name
    validates :kana_last_name
    validates :kana_first_name
    validates :password
    validates :birthday
  end

  with_options allow_blank: true do
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
    validates :kana_last_name, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :kana_first_name, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-z\d]+\z/ }
  end
end
