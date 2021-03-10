require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)

    def error_check(str)
      @user.valid?
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
      error_check("Email can't be blank")
    end

    it 'メールアドレスに一意性あり' do
      user = FactoryBot.create(:user)
      @user.email = user.email
      @user.valid?
      error_check('Email has already been taken')
    end

    it 'メールアドレスに＠がないと登録できない' do
      @user.email = @user.email.gsub(/@/, 'a')
      error_check('Email is invalid')
    end

    it 'パスワードが空だと登録できない' do
      @user.password = ''
      error_check("Password can't be blank")
    end

    it 'パスワードは６文字以上じゃないと登録できない' do
      @user.password = '111aa'
      @user.password_confirmation = @user.password
      error_check('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードとパスワード（確認用）、値が不一致だと登録できない' do
      @user.password_confirmation = @user.password + 'aaa'
      error_check("Password confirmation doesn't match Password")
    end

    it 'パスワードが半角数字のみの場合は登録できない' do
      @user.password = 123456
      @user.password_confirmation = @user.password
      error_check("Password is invalid")
    end
    
    it 'パスワードが半角英字のみの場合は登録できない' do
      @user.password = "abcdef"
      @user.password_confirmation = @user.password
      error_check("Password is invalid")
    end

    it 'パスワードが全角の場合は登録できない' do
      @user.password = "１２３ＡＢＣ"
      @user.password_confirmation = @user.password
      error_check("Password is invalid")
    end

    it 'last_nameは空では登録できない' do
      @user.last_name = ""
      error_check("Last name can't be blank")
    end
    
    it 'first_nameは空では登録できない' do
      @user.first_name = ""
      error_check("First name can't be blank")
    end

    it 'last_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      
     array = ['1','３','a', 'Ａ']

     array.each do |value|
       @user.last_name += value
       error_check('Last name is invalid')
     end
   end
  end
end
