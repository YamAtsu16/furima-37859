# テーブル設計

## users テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| nickname   | string     | null: false |
| email      | string     | null: false |
| password   | string     | null: false |
| birthday   | date       | null: false |

### Association

- has_many :items
- has_many :comments
- has_one  :buy

## items テーブル

| Column           | Type         | Options                                |
| ---------------- | ------------ | -------------------------------------- |
| name             | string       | null: false                            |
| text             | string       | null: false                            |
| category         | string       | null: false, pulldown                  |
| condition        | string       | null: false, pulldown                  |
| price            | integer      | null: false, min(300), max(9,999,999)  |
| delivery_charge  | integer      | null: false, pulldown                  |
| source           | string       | null: false, pulldown                  |
| shipping_date    | date         | null: false, pulldown                  |
| user_id          | references   | null: false, foreign_key:true          |

### Association

- belongs_to :user
- has_one :buy
- has_many :comments

## buys テーブル

| Column           | Type        | Options                          |
| ---------------- | ----------- | -------------------------------- |
| card             | integer     | null: false                      |
| postal_code      | integer     | null: false                      |
| prefectures      | string      | null: false                      |
| municipalities   | string      | null: false                      |
| address          | string      | null: false                      |
| building         | string      |                                  |
| tell             | integer     | null: false, min(10), max(11)    |
| user_id          | references  | null: false, foreign_key:true    |
| item_id          | references  | null: false, foreign_key:true    |

### Association

- belongs_to :user
- belongs_to :item

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item