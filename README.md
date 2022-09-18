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
| password           | string | null: false                    |
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
| item_image         | string     | null: false                    |
| item_price         | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| category           | references | null: false, foreign_key: true |
| item_condition     | references | null: false, foreign_key: true |
| preparation_day    | references | null: false, foreign_key: true |
| postage_payer      | references | null: false, foreign_key: true |
| prefectures        | references | null: false, foreign_key: true |


### association

- belongs_to :user, dependent: :destroy
- has_one :item_purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :preparation_day
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :prefectures


## purchase_informations テーブル

| column             | Type       | options                        |
| ------------------ | ---------- | ------------------------------ |
| postcode           | string     | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     | null: false                    |
| phone_number       | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |


### association

- has_one  :item_purchases
- has_one_active_hash :prefectures


## item_purchases テーブル

| column               | Type       | options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| item                 | references | null: false, foreign_key: true |
| purchase_information | references | null: false, foreign_key: true |



### association

- belongs_to :user
- belongs_to :item
- belongs_to :purchase_information