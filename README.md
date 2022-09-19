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

## users テーブル

| column             | Type   | options                        |
| ------------------ | ------ | ------------------------------ |
| nickname           | string | null: false                    |
| email              | string | null: false,                   |
| encrypted_password | string | null: false                    |
| lastname           | string | null: false                    |
| firstname          | string | null: false                    |
| lastname_kana      | string | null: false                    |
| firstname_kana     | string | null: false                    |
| birthday           | date   | null: false                    |

### association

- has_many :items
- has_many :item_purchases


##  itemsテーブル

| column             | Type       | options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_description   | text       | null: false                    |
| item_price         | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| category           | integer    | null: false                    |
| item_condition     | integer    | null: false                    |
| preparation_day    | integer    | null: false                    |
| postage_payer      | integer    | null: false                    |
| prefecture         | integer    | null: false                    |


### association

- belongs_to :user, dependent: :destroy
- belongs_to :item_purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :preparation_day
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :prefecture


## purchase_informations テーブル

| column             | Type       | options                        |
| ------------------ | ---------- | ------------------------------ |
| postcode           | string     | null: false                    |
| prefecture         | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| phone_number       | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |


### association

- has_one  :item_purchase
- has_one_active_hash :prefecture


## item_purchases テーブル

| column               | Type       | options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| item                 | references | null: false, foreign_key: true |


### association

- belongs_to :user
- belongs_to :item
- belongs_to :purchase_information