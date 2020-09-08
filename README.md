# テーブル設計b

## users テーブル

| Column                | Type       | Options     |
| --------------------- | ---------- | ----------- |
| name                  | string     | null: false |
| email                 | string     | null: false |
| password              | string     | null: false |
| password_confirmation | string     | null: false |
| family_name           | string     | null: false |
| first_name            | string     | null: false |
| family_name_cana      | string     | null: false |
| first_name_cana       | string     | null: false |
| birthday              | datetime   | null: false |

### Association

- has_many :purchase_items
- has_many :items
- has_many :purchases, through: purchase_items

## purchases テーブル
| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| postal_code   | string    | null: false |
| prefectures   | integer   | null: false |
| city          | string    | null: false |
| address       | string    | null: false |
| building_name | string    |             |
| phone_number  | string    | null: false |

### Association

- has_many :users, through: purchase_items
- has_many :items
- has_many :purchase_items

## items テーブル

| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| title    | string    | null: false                    |
| content  | text      | null: false                    |
| price    | integer   | null: false                    |
| category | integer   | null: false                    |
| status   | integer   | null: false                    |
| burden   | integer   | null: false                    |
| area     | integer   | null: false                    |
| day      | integer   | null: false                    |

### Association

- belongs_to :user

## purchase_items テーブル
| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| user     | reference | null: false, foreign_key: true |
| item     | reference | null: false, foreign_key: true |

### Association

- has_one :user
- has_one :item