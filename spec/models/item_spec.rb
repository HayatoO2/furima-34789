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
      
      it  do
        binding.pry
      end

    end

    context '商品の出品ができない' do
    end

  end



end
