# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

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
| birth_year         | integer | null: false               |
| birth_month        | integer | null: false               |
| birth_day          | integer | null: false               |
### Association
has_many :items
has_many :purchases
<!-- has_many :comments -->

## Itemsテーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_image      | text       | null: false                    |
| item_name       | string     | null: false                    |
| description     | string     | null: false                    |
| price           | integer    | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| shipping_fee    | string     | null: false                    |
| item_prefecture | string     | null: false                    |
| shipping_date   | string     | null: false                    |
| user_id         | references | null: false, foreign_key: true |
### Association
belongs_to :user
has_one :purchase
<!-- has_many :comment -->

## Purchasesテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| post_num            | string     | null: false                    |
| purchase_prefecture | string     | null: false                    |
| municipality        | string     | null: false                    |
| address             | string     | null: false                    |
| building            | string     |                                |
| phone_num           | string     | null: false                    |
| user_id             | references | null: false, foreign_key: true |
| item_id             | references | null: false, foreign_key: true |
### Association
belongs_to :user
belongs_to :item

<!--
## Commentsテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | string     | null: false                    |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |
### Association
belongs_to :user
belongs_to :item
-->