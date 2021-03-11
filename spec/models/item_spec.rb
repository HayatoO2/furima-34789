require 'rails_helper'

RSpec.describe Item, type: :model do
  
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.user_id = user.id
    @item.image = fixture_file_upload('app/assets/images/flag.png')
  end


  describe '商品出品機能' do

    context '商品の出品がうまくいく' do
      
      it  '適切な値を入力したら出品できる' do
        expect(@item).to be_valid
      end

    end

    context '商品の出品ができない' do

      it '商品名が未入力だと出品できない' do
      end
      
      it '商品説明が未入力だと出品できない' do
      end
      
      it 'カテゴリー情報が未選択（id=1）だと出品できない' do
      end
      
      it '商品の状態が未選択（id=1）だと出品できない' do
      end
      
      it '配送料の負担が未選択（id=1）だと出品できない' do
      end
      
      it '配送元の地域が未選択（id=1）だと出品できない' do
      end
      
      it '配送までの日数が未選択（id=1）だと出品できない' do
      end
      
      it '販売価格が未入力だと出品できない' do
      end
      
      it '販売価格が300円未満だと出品できない' do
      end
      
      it '販売価格が9999999円より大きいと出品できない' do
      end
      
      it '販売価格が全角数字だと出品できない' do
      end
      
      it '画像がアップロードされてないと出品できない' do
      end
      
    end
    
  end



end
