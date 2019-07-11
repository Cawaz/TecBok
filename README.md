# 技術書のレビュー投稿サイト「TecBok」
技術書のレビューを投稿できるアプリです。

## 投稿一覧画面
![ScreenShot 2019-07-11 22 43 37](https://user-images.githubusercontent.com/47560224/61055937-7b434300-a42d-11e9-8ea5-c72f17b69938.jpg)
## 投稿詳細画面
![ScreenShot 2019-07-11 22 43 59](https://user-images.githubusercontent.com/47560224/61055942-7d0d0680-a42d-11e9-9284-9324c833208f.jpg)
# URL
https://tecbok.herokuapp.com/

## Basic認証
- ユーザー名： user
- パスワード： password 

# 技術スタック
- Ruby 2.5.3
- Ruby on Rails 5.2.3
  - HTMLテンプレートエンジン：Slim
- RSpec 3.7
  - CircleCIによる自動化
- MySQL 5.7.22
- Docker Desktop 2.0.0.3

# 主な機能
- 投稿の一覧表示
  - ページネーション(kaminari)
- 投稿の詳細表示
- 投稿の登録・編集・削除
  - 評価を5つ星表示
  - カテゴリ分け
- 投稿の検索(ransack)
- 画像ファイルのアップロード(Active Storage)
  - ストレージ：AWS S3
- 投稿にコメント・削除(Ajax)
- 投稿にいいね・削除(Ajax)
- ユーザの登録・編集・削除(devise)
- マイページ

# 設計書
### 要件定義書（タスクばらし）
https://quip.com/sOzwAvsCEzVK
### ER図
![ScreenShot 2019-07-11 22 50 51](https://user-images.githubusercontent.com/47560224/61056465-5d2a1280-a42e-11e9-938c-d0561a7c9be6.jpg)
### 画面遷移図
![ScreenShot 2019-07-07 13 07 20](https://user-images.githubusercontent.com/47560224/61056474-60250300-a42e-11e9-9a7f-17af715c4eb7.jpg)