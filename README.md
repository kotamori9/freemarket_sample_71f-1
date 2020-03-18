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
|familyName|string|null: false|
|firstName|string|null: false|
|familyNameFurigana|string|null: false|
|firstNameFurigana|string|null: false|
|sendAddress|string|null: false|
|sendAddressFurigana|string|null: false|
|postalCode|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|addressNumber|string|null: false|
|anyAddressInfo|string||
|creditCard|string|null: false|
|tel|string||
### usersAssociation
- has_many :items
- has_many :comments

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|user_id|integer|foreign_key: true|
|brand_id|intger|foreign_key: true|
|category_id|integer||
|itemName|string||
|itemDescription|string||
|itemStatus|string||
|itemPrice|string||
|shippingCharges|string||
|daysToShip|string||
### itemsAssociation
- belongs_to :user
- belongs_to :barand
- belongs_to :category
- belongs_to :basket
- has_many :comments
- has_many :photos
- has_many :basket

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
|user_id|string|foreign_key: true|
### commentsAssociation
- belongs_to :user
- belongs_to :items

## basketテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer||
|item_id|string|foreign_key: true|
|user_id|string|foreign_key: true|
### basketAssociation
- belongs_to :user
- belongs_to :item
- has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|id|string||
|brandName|string||
### brandsAssociation
- has_many :items

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|id|string||
### categorysAssociation
- has_many :items