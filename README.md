# 技術書のレビュー投稿サイト「TecBok」
技術書のレビューを投稿できるアプリです。

## 投稿一覧画面
![post_index](https://user-images.githubusercontent.com/47560224/60763696-f070ea00-a0b4-11e9-96ef-404ce1a97339.jpg)
## 投稿詳細画面
![post_show](https://user-images.githubusercontent.com/47560224/60763695-efd85380-a0b4-11e9-84a1-4c1578ccf5e9.jpg)
# URL
https://tecbok.herokuapp.com/

## Basic認証
- ユーザ： user
- パスワード： password 

# 技術スタック
- Ruby 2.5.3
- Ruby on Rails 5.2.3
  - HTMLテンプレートエンジン：Slim
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