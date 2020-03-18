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
|email|string|-----|
|pass|string|null: false|
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
|creditCard|string|null: false|
### usersAssociation
- has_many :items
- has_many :comments

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|user_id|integer|----|
|brand_id|intger|----|
|category_id|integer|---|
|itemName|string|-----|
|itemDescription|string|-----|
|itemStatus|string|-----|
|itemPrice|string|-----|
|shippingCharges|string|-----|
|daysToShip|string|-----|
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
|image|string|-----|
### photosAssociation
- belongs_to :item

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|-----|
|user_id|string|----|
### commentsAssociation
- belongs_to :user
- belongs_to :items

## basketテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|string|-----|
|user_id|string|----|
### basketAssociation
- belongs_to :user
- has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|id|string|-----|
### brandsAssociation
- has_many :items

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|id|string|-----|
### categorysAssociation
- has_many :items