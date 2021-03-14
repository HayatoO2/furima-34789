require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    @buy = FactoryBot.build(:buy_address)
    user = FactoryBot.create(:user)
    item = FactoryBot.build(:item)
    item.image = fixture_file_upload('app/assets/images/flag.png')
    item.user_id = user.id
    item.save
    sleep 0.05 # 0.1秒待機
    
    def error_check(str)
      @buy.valid?
      expect(@item.errors.full_messages).to include(str)
    end
  end


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
      end
      it 'telephoneが全角数字だと購入できない' do
      end
      it 'telephoneが12桁以上だと購入できない' do
      end
    end
  end
end
