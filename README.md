# テーブル設計

## users テーブル

| Column              | Type       | Options                 |
| ------------------- | ---------- | ----------------------  |
| nickname            | string     | null: false             |
| email               | string     | null: false, 一意性制約   |
| encrypted_password  | string     | null: false             |
| birthday            | date       | null: false             |
| first_name          | string     | null: false, 全角        |
| last_name           | string     | null: false, 全角        |
| first_name_kana     | string     | null: false, 全角カタカナ |
| last_name_kana      | string     | null: false, 全角カタカナ |

### Association

- has_many :items
- has_many :comments
- has_many :buyers
- has_many :orders


## items テーブル

| Column           | Type         | Options                                |
| ---------------- | ------------ | -------------------------------------- |
| name             | string       | null: false                            |
| text             | text         | null: false                            |
| category         | string       | null: false, pulldown                  |
| condition        | string       | null: false, pulldown                  |
| price            | integer      | null: false                            |
| delivery_charge  | integer      | null: false, pulldown                  |
| prefecture_id    | integer      | null: false, pulldown                  |
| shipping_date    | date         | null: false, pulldown                  |
| user_id          | references   | null: false, foreign_key:true          |

### Association

- belongs_to :user
- has_one :buyer
- has_one :order
- has_many :comments


## buyers テーブル

| Column           | Type        | Options                          |
| ---------------- | ----------- | -------------------------------- |
| postal_code      | string      | null: false                      |
| prefecture_id    | integer     | null: false                      |
| municipalities   | string      | null: false                      |
| address          | string      | null: false                      |
| building         | string      |                                  |
| tell             | string      | null: false                      |

### Association

- belongs_to :user
- belongs_to :item
- has_many   :orders


## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
| buyer  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :buyer


## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

