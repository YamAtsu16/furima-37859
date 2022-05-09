# テーブル設計

## users テーブル

| Column              | Type       | Options                   |
| ------------------- | ---------- | ------------------------- |
| nickname            | string     | null: false               |
| email               | string     | null: false, unique: true |
| encrypted_password  | string     | null: false               |
| birthday            | date       | null: false               |
| first_name          | string     | null: false               |
| last_name           | string     | null: false               |
| first_name_kana     | string     | null: false               |
| last_name_kana      | string     | null: false               |

### Association

- has_many :items
- has_many :comments
- has_many :orders


## items テーブル

| Column              | Type         | Options                        |
| ------------------- | ------------ | ------------------------------ |
| name                | string       | null: false                    |
| text                | text         | null: false                    |
| price               | integer      | null: false                    |
| category_id         | integer      | null: false                    |
| condition_id        | integer      | null: false                    |
| delivery_charge_id  | integer      | null: false                    |
| prefecture_id       | integer      | null: false                    |
| shipping_date_id    | integer      | null: false                    |
| user                | references   | null: false, foreign_key:true  |

### Association

- belongs_to :user
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
| order            | references  | null: false, foreign_key: true   |

### Association

- belongs_to :orders


## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :buyer


## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

