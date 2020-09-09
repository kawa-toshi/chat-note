# README

## アプリ名
chat-note

## 本番環境
https://chat-note.herokuapp.com/users/sign_in

## 概要
話題をあらかじめ記録しておくアプリです。
ネタを書くボタンを押すとネタを登録できます。

## USAGE
自分の周りで起こった出来事などを記録しておくことで、実際に人と会った時にそのネタを話すことで話題に困ることを少しでも減らせます。

## 今後の実装予定の内容
周りの人々の特徴を記録するつながり機能
一日に何人と話したかをグラフ化する機能

### DB設計


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

