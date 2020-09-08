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
| year                  | reference  | null: false |
| month                 | reference  | null: false |
| day                   | reference  | null: false |

### Association

- has_many :purchase_items
- has_many :items
- has_many :purchases, through: purchase_items

## purchases テーブル
| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| postal_code   | string    | null: false |
| prefectures   | string    | null: false |
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
| content  | text    | null: false                    |
| price    | string    | null: false                    |
| category | reference | null: false                    |
| status   | reference | null: false                    |
| burden   | reference | null: false                    |
| area     | reference | null: false                    |
| day      | reference | null: false                    |

### Association

- belongs_to :users

## purchase_items テーブル
| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| user     | reference | null: false, foreign_key: true |
| item     | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item