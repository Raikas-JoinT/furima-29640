# テーブル設計b

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :purchase_items
- has_many :items
- has_many :purchases, through: purchase_items

## purchases テーブル
| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| card_number   | integer   | null: false |
| card_month    | integer   | null: false |
| card_year     | integer   | null: false |
| secure_number | integer   | null: false |
| postal_code   | integer   | null: false |
| prefectures   | reference | null: false |
| city          | string    | null: false |
| address       | string    | null: false |
| building_name | string    | null: false |
| phone_number  | integer   | null: false |

### Association

- has_many :users, through: purchase_items
- has_many :items
- has_many :purchase_items

## items テーブル

| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| image    | reference | null: false, foreign_key: true |
| title    | string    | null: false                    |
| content  | text      | null: false                    |
| price    | integer   | null: false                    |
| category | reference | null: false                    |
| status   | reference | null: false                    |
| burden   | reference | null: false                    |
| area     | reference | null: false                    |
| day      | reference | null: false                    |

### Association

- has_many :users

## purchase_items テーブル
| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| user     | reference | null: false, foreign_key: true |
| item     | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item