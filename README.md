# テーブル設計

## Usersテーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| family_name_kana   | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |
### Association
has_many :items
has_many :histories

## Itemsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| description        | text       | null: false                    |
| price              | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_fee_id    | integer    | null: false                    |
| item_prefecture_id | integer    | null: false                    |
| shipping_date_id   | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
### Association
belongs_to :user
has_one :history

## Ordersテーブル
| Column             | Type       | Options                        |
| ------------------ | -----------| ------------------------------ |
| post_num           | string     | null: false                    |
| item_prefecture_id | integer    | null: false                    |
| municipality       | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| phone_num          | string     | null: false                    |
### Association
belongs_to :history

## Historiesテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
### Association
belongs_to :user
belongs_to :item
has_one :order