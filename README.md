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
|nickname|string|-----|
|email|string|-----|
|pass|string|-----|
|familyName|string|-----|
|firstName|string|-----|
|familyNameFurigana|string|-----|
|firstNameFurigana|string|-----|
|sendAddress|string|-----|
|sendAddressFurigana|string|-----|
|postalCode|string|-----|
|prefecture|string|----|
|city|string|-----|
|addressNumber|string|----|
### usersAssociation
- has_many :items
- has_many :comments

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
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
|photoUrl|string|-----|
### photosAssociation
- belongs_to :item

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|------|string|-----|
### commentsAssociation
- belongs_to :user
- belongs_to :items

## basketテーブル
|Column|Type|Options|
|------|----|-------|
|------|string|-----|
### basketAssociation
- belongs_to :user
- has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|------|string|-----|
### brandsAssociation
- has_many :items

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|------|string|-----|
### categorysAssociation
- has_many :items