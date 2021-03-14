FactoryBot.define do
  factory :buy_address do
    token { 'tok_abcdefghijk00000000000000000' }
    post_num { '123-4567' }
    prefecture_id { rand(2..48) }
    city { Gimei.address.city.kanji }
    house_num { Gimei.town.kanji }
    building { 'TECH' }
    telephone { '09012345678' }
  end
end
