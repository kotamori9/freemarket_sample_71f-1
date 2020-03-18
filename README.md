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
|------|string|-----|
### usersAssociation
- has_many :items
- has_many :comments

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|------|string|-----|
### itemsAssociation
- belongs_to :user
- belongs_to :barand
- belongs_to :category
- belongs_to :basket

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