# README

# テーブル設計


## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ------------|
| nickname           | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| kana_last_name     | string  | null: false |
| kana_first_name    | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| birthday           | date    | null: false |


### Association

- has_many :items
- has_many :buys


## items テーブル

| Column           | Type       | Options                           |
| ---------------- | ---------- | ----------------------------------|
| name             | string     |  null: false  maxlength: 39       |
| text             | text       |  null: false , maxlength: 999     |
| category_id      | integer    |  null: false                      |
| status_id        | integer    |  null: false                      |
| pay_id           | integer    |  null: false                      |
| prefecture_id    | integer    |  null: false                      |
| delivery_date_id | integer    |  null: false                      |
| price            | integer    |  null: false , range 300..9999999 |
| user             | references |  foreign_key: true                |

### Association

- belongs_to : user
- has_one    :buy



## buys テーブル

| Column | Type       | Options           | 
| -------| -----------| ------------------|
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options                         |
| ------------- | -----------| --------------------------------|
| telephone     | string     |  null: false                    |
| post_num      | string     |  null: false                    |
| prefecture_id | integer    |  null: false                    |
| city          | string     |  null: false                    |
| house_num     | string     |  null: false                    |
| building      | string     |                                 |
| buy_id        | references |  null: false ,foreign_key: true |

### Association

- belongs_to :buy
