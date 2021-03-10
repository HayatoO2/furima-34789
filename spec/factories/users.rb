FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    last_name { '山田' }
    first_name { 'ひとみ' }
    kana_last_name { Gimei.last.katakana }
    kana_first_name { Gimei.first.katakana }
    email { Faker::Internet.free_email }
    password { '111aaa' }
    password_confirmation { password }
    birthday { Faker::Date.between(from: '1930-01-01', to: Date.today) }
  end
end
