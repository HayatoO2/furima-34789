# README

# テーブル設計

### * = null: false

## users テーブル

| Column            | Type    | Options |
| ----------------- | ------- | --------|
| nickname          | string  | *       |
| last_name         | string  | *       |
| first_name        | string  | *       |
| kana_last_name    | string  | *       |
| kana_first_name   | string  | *       |
| email             | string  | *       |
| password          | string  | *       |
| birthday          | integer | *       |


### Association

- has_many :items
- has_many :buys


## items テーブル

| Column           | Type    | Options               |
| ---------------- | ------- | ----------------------|
| name             | string  | *, maxlength: 39      |
| text             | text    | *, maxlength: 999     |
| category_id      | integer | *                     |
| status_id        | integer | *                     |
| pay_id           | integer | *                     |
| delivery_pref_id | integer | *                     |
| delivery_date_id | integer | *                     |
| price            | integer | *, range 300..9999999 |

### Association

- belongs_to : user
- has_one    :buy



## buys テーブル

| Column  | Type       | Options           | 
| ------- | -----------| ------------------|
| user_id | references | foreign_key: true |
| item_id | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options             |
| ------------- | -----------| --------------------|
| telephone     | string     | *                   |
| post_num      | string     | *                   |
| prefecture_id | integer    | *                   |
| city          | string     | *                   |
| house_num     | string     | *                   |
| building      | string     |                     |
| buy_id        | references | *,foreign_key: true |

### Association

- belongs_to :buy
