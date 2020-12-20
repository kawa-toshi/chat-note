# README

## アプリ名

chat-note

## 本番環境

https://chat-note.herokuapp.com/users/sign_in

テストアカウント
メールアドレス test@com
パスワード testsample

## 概要

話題をあらかじめ記録しておくアプリです。
ネタを書くボタンを押すとネタを登録できます。

## USAGE

会話の時にどんなことを話せばいいのか困ることがあるので作成しました。
自分の周りで起こった出来事などを記録しておき、実際に人と会った時にそのネタを話すことで話題に困ること減らすことができます。
また、一日に話した人数をグラフで可視化できます。

## 今後の実装予定の内容

周りの人々の特徴を記録するつながり機能。

### DB 設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |

### Association

- has_many :notes
- has_many :connections

## connections テーブル

| Column   | Type    | Options                        |
| -------- | ------- | ------------------------------ |
| name     | string  | null: false                    |
| features | text    | null: false                    |
| user_id  | integer | null: false, foreign_key: true |

### Association

- belongs_to :user

## notes テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| theme   | string  | null: false                    |
| details | text    | null: false                    |
| user_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :group
- belongs_to :user

## experiences テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| number  | integer | null: false                    |
| user_id | integer | null: false, foreign_key: true |
