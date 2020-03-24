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
|nickname|string|null: false|
|email|string|unique: true|
|encrypted_password|string|null: false, length: { minimum: 7 }|
|birthday|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_furigana|string|null: false|
|first_name_furigana|string|null: false|
|tell|string||
### usersAssociation
- has_many :items
- has_many :comments
- has_many :addresses
- has_many :creditcards

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|destination_name|string|null: false|
|destination_name_furigana|string|null: false|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address_number|string|null: false|
|any_address_info|string||
## addressAssociation
- belongs_to :user


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|brand_id|integer|foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|name|string|null: false|
|description|string|null: false|
|status|string|null: false|
|price|string|null: false|
|shipping_charges|string|null: false|
|days_to_ship|string|null: false|
### itemsAssociation
- belongs_to :user
- belongs_to :brand
- belongs_to :category
- has_many :purchased
- has_many :comments
- has_many :photos

## photosテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|image|string|null: false|
### photosAssociation
- belongs_to :item

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|item_id|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### commentsAssociation
- belongs_to :user
- belongs_to :item

## purchasedテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|foreign_key: true|
|user_id|integer|foreign_key: true|
### basketAssociation
- belongs_to :user
- belongs_to :item

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|integer|null: false|
|ancestry|string|null: false|
### brandsAssociation
- has_many :items
- has_ancestry

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### categorysAssociation
- has_many :items
- has_ancestry

## creditcardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|
### creditcardsAssociation
- belongs_to :user