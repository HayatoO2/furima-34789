require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録機能' do
    it 'メールアドレスは必須' do
    end
  end
end
