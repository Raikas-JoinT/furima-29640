# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :rooms
- has_many :items
- has_many :room_users

## rooms テーブル
| Column   | Type      | Options     |
| -------- | --------- | ----------- |
| item     | reference | null: false |
| price    | string    | null: false |
| image    | string    | null: false |

- has_many :users
- has_many :items
- has_many :room_users

## items テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| item     | string | null: false |
| text     | string | null: false |
| image    | string | null: false |

### Association

belongs_to :user
belongs_to :room

## room_users テーブル
| Column   | Type      | Options     |
| -------- | --------- | ----------- |
| user     | reference | null: false |
| comment  | reference | null: false |

### Association

belongs_to :user
belongs_to :room