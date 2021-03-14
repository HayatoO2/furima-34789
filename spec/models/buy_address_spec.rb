require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    @buy = FactoryBot.build(:buy_address)
    user = FactoryBot.create(:user)
    item = FactoryBot.build(:item)
    item.image = fixture_file_upload('app/assets/images/flag.png')
    item.user_id = user.id
    item.save
    @buy.user_id = user.id
    @buy.item_id = item.id
    sleep 0.05 
    
    def error_check(str)
      @buy.valid?
      expect(@buy.errors.full_messages).to include(str)
    end
  end


  describe '商品購入機能' do
    context '商品購入できる' do
      it '適切な値を入力したら商品購入できる' do
        expect(@buy).to be_valid
      end

      it 'buildingが未入力でも商品購入できる' do
        @buy.building = nil
        expect(@buy).to be_valid
      end
    end

    context '商品購入できない' do
      it 'tokenが空だと購入できない' do
        @buy.token = nil
        error_check("Token can't be blank")
        
      end
      it 'post_numが未入力だと購入できない' do
        @buy.post_num = nil
        error_check("Post num can't be blank")
      end
      it 'post_numが-なしだと購入できない' do
        @buy.post_num = @buy.post_num.sub('-','')
        error_check("Post num is invalid")
      end
      it 'prefecture_idが1だと購入できない' do
        @buy.prefecture_id = 1
        error_check("Prefecture must be other than 1")
      end
      it 'cityが未入力だと購入できない' do
        @buy.city = nil
        error_check("City can't be blank")
      end
      it 'house_numが未入力だと購入できない' do
        @buy.house_num = nil
        error_check("House num can't be blank")
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
