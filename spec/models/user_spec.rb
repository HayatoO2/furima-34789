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
    context 'ユーザー登録できるとき' do
      it '適切な値を入力したら登録できる' do
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録できないとき' do
      it 'メールアドレスは必須' do
        @user.email = ''
        error_check("Email can't be blank")
      end

      it 'ユーザー名が未入力のとき登録できない' do
        @user.nickname = ''
        error_check("Nickname can't be blank")
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
        @user.password = '123456'
        @user.password_confirmation = @user.password
        error_check('Password is invalid')
      end

      it 'パスワードが半角英字のみの場合は登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        error_check('Password is invalid')
      end

      it 'パスワードが全角の場合は登録できない' do
        @user.password = '１２３ＡＢＣ'
        @user.password_confirmation = @user.password
        error_check('Password is invalid')
      end

      it 'last_nameは空では登録できない' do
        @user.last_name = ''
        error_check("Last name can't be blank")
      end

      it 'first_nameは空では登録できない' do
        @user.first_name = ''
        error_check("First name can't be blank")
      end

      it 'last_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        array = %w[1 ３ a Ａ]

        array.each do |value|
          @user.last_name += value
          error_check('Last name is invalid')
        end
      end

      it 'first_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        array = %w[1 ３ a Ａ]

        array.each do |value|
          @user.first_name += value
          error_check('First name is invalid')
        end
      end

      it 'kana_last_nameは空では登録できない' do
        @user.kana_last_name = ''
        error_check("Kana last name can't be blank")
      end

      it 'kana_first_nameは空では登録できない' do
        @user.kana_first_name = ''
        error_check("Kana first name can't be blank")
      end

      it 'kana_last_nameは全角（カタカナ）でなければ登録できない' do
        array = %w[山 1 ３ a Ａ あ]

        array.each do |value|
          @user.kana_last_name += value
          error_check('Kana last name is invalid')
        end
      end

      it 'kana_first_nameは全角（カタカナ）でなければ登録できない' do
        array = %w[山 1 ３ a Ａ あ]

        array.each do |value|
          @user.kana_first_name += value
          error_check('Kana first name is invalid')
        end
      end

      it 'birthdayは空では登録できない' do
        @user.birthday = ''
        error_check("Birthday can't be blank")
      end
    end
  end
end
