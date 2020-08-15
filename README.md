# README

## アプリ名
chat-note

## notes_tagsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :tag
- belongs_to :user


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|



### Association
- has_many :notes
- has_many :connections


## connectionsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|features|text|null: false|
|user_id|integer|null: false, foreign_key: true|



### Association
- belongs_to :user



## notesテーブル

|Column|Type|Options|
|------|----|-------|
|theme|string| null:false|
|details|text| null:false|
|user_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## tagsテーブル

|Column|Type|Options|
|------|----|-------|
|tag_name|string| |

### Association
- has_many :notes_tags
- has_many :notes, through:notes_tags

