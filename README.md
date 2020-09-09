# テーブル設計b

## users テーブル

| Column                | Type       | Options     |
| --------------------- | ---------- | ----------- |
| name                  | string     | null: false |
| email                 | string     | null: false |
| encrypted_password    | string     | null: false |
| family_name           | string     | null: false |
| first_name            | string     | null: false |
| family_name_cana      | string     | null: false |
| first_name_cana       | string     | null: false |
| birthday              | date       | null: false |

### Association

- has_many :addresses_items
- has_many :items

## addresses テーブル
| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| postal_code    | string    | null: false                    |
| prefectures    | integer   | null: false                    |
| city           | string    | null: false                    |
| address        | string    | null: false                    |
| building_name  | string    |                                |
| phone_number   | string    | null: false                    |
| addresses_item | reference | null: false, foreign_key: true |

### Association

- belongs_to :addresses_item

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
| user     | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :addresses_item

## addresses_items テーブル
| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| user     | reference | null: false, foreign_key: true |
| item     | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

- has_one :address