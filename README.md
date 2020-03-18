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

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|nickname|string|null: false|
|email|string|unique: true|
|pass|string|null: false, length: { minimum: 7 }|
|birthday|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_furigana|string|null: false|
|first_name_furigana|string|null: false|

|credit_card|string|null: false|
|tel|string||
### usersAssociation
- has_many :items
- has_many :comments

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|destination_name|string|null: false|
|destination_name_furigana|string|null: false|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address_number|string|null: false|
|any_address_info|string||
## addressAssociation


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|user_id|integer|foreign_key: true|
|brand_id|intger|foreign_key: true|
|category_id|integer||
|item_name|string||
|item_description|string||
|item_status|string||
|item_price|string||
|shipping_charges|string||
|days_to_ship|string||
### itemsAssociation
- belongs_to :user
- belongs_to :barand
- belongs_to :category
- belongs_to :basket
- has_many :comments
- has_many :photos

## photosテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|image|string||
### photosAssociation
- belongs_to :item

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text||
|item_id|string||
|user_id|string|foreign_key: true|
### commentsAssociation
- belongs_to :user
- belongs_to :item

## basketテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer||
|item_id|string|foreign_key: true|
|user_id|string|foreign_key: true|
### basketAssociation
- belongs_to :user
- has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|id|string|null: false|
|name|string|null: false|
### brandsAssociation
- has_many :items

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|id|string|null: false|
### categorysAssociation
- has_many :items