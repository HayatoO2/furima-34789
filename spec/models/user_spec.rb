require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)

    def error_check(str)
      expect(@user.errors.full_messages).to include(str)
    end
  end

  describe 'ユーザー登録機能' do
    it '適切な値を入力したら登録できる' do
      @user.valid?
      expect(@user).to be_valid
    end
    it 'メールアドレスは必須' do
      @user.email = ''
      @user.valid?
      error_check("Email can't be blank")
    end
    it 'メールアドレスに一意性あり' do
      user = FactoryBot.create(:user)
      @user.email = user.email
      @user.valid?
      error_check("Email has already been taken")
    end
  end
end
