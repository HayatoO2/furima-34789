require 'rails_helper'

RSpec.describe Buy, type: :model do
  describe '商品購入機能' do
    context '商品購入できる' do
      it '適切な値を入力したら商品購入できる' do
      end

      it 'buildingが未入力でも商品購入できる' do
      end
    end

    context '商品購入できない' do
      it 'tokenが空だと購入できない' do
      end
      it 'post_numが未入力だと購入できない' do
      end
      it 'post_numが-なしだと購入できない' do
      end
      it 'prefecture_idが1だと購入できない' do
      end
      it 'cityが未入力だと購入できない' do
      end
      it 'house_numが未入力だと購入できない' do
      end
      it 'telephoneが未入力だと購入できない' do
      it 'telephoneが全角数字だと購入できない' do
      end
      it 'telephoneが12桁以上だと購入できない' do
      end
    end
  end
end
