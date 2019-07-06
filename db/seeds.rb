# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User
User.create(username: "テストユーザー", email: "test@example.com", password: "password")
User.create(username: "Alice", email: "alice@example.com", password: "password")
User.create(username: "Bob", email: "bob@example.com", password: "password")

# Post
Post.create(
    title: "現場で使える Ruby on Rails 5速習実践ガイド",
    review: "RailsでどのようにWebアプリケーションを作るのかという基本的なところから、現場のニーズに合わせてどのように機能を追加していくのか、テストはどのように行うのか、複数人で開発していく場合の方法といった実践的なトピックまで、幅広くカバーしています。 ",
    rate: 8,
    user_id: 1
)

Post.create(
    title: "Webを支える技術",
    review: "Webサービスにおける設計課題，たとえば望ましいURI，HTTPメソッドの使い分け，クライアントとサーバの役割分担，設計プロセスなどについて，現時点のベストプラクティスを紹介しています。",
    rate: 7,
    user_id: 1
)

Post.create(
    title: "プロを目指す人のためのRuby入門",
    review: "本書はあくまでRubyの入門本であり、Railsの入門本ではありません。ですが、「Railsアプリを開発するなら、ここは必ず押さえておきたい」というRubyの基礎知識は必ずカバーするようにしています。",
    rate: 8,
    user_id: 1
)

Post.create(
    title: "体系的に学ぶ 安全なWebアプリケーションの作り方 第2版",
    review: "Webアプリケーションにはなぜ脆弱性が生まれるのか？
            脆弱性を解消するにはどうプログラミングすればよいか？
            PHPサンプルへの攻撃を通して脆弱性が生まれる原理と具体的な対処方法が学べます。",
    rate: 9,
    user_id: 1
)

Post.create(
    title: "ノンデザイナーズ・デザインブック",
    review: "20年以上愛されている、デザインの定番書です。
デザインはデザイナーだけに必要な要素ではありません。いまやエクセルやワード、パワーポイントを使って資料を作る際にも重要となります。読みやすいデザイン、伝わるプレゼン資料、わかりやすいレイアウトを作りたい方におすすめの一冊です。",
    rate: 6,
    user_id: 1
)
Post.create(
    title: "たのしいRuby 第6版",
    review: "Rubyの基礎を勉強するにはいい本です。",
    rate: 4,
    user_id: 1
)

Post.create(
    title: "SQL 第2版 ゼロからはじめるデータベース操作",
    review: "「データベースやSQLがはじめて」という初心者を対象に、プロのデータベース（DB）エンジニアである著者がSQLの基礎とコツをやさしく丁寧に教える入門書です。",
    rate: 9,
    user_id: 1
)

Post.create(
    title: "なるほどデザイン",
    review: "「デザイン＝楽しい」を実感できる新しいデザイン書籍。
            デザインする上で必要な基礎、概念、ルール、プロセスを図解やイラスト、
            写真などのビジュアルで解説しています。
            現場で活躍しているデザイナーが身近にあるわかりやすいものに例えたり、
            図解、イラスト、別のものに置き換えて見方を変えてみたり…
            豊富なビジュアルとともにわかりやすくひも解いた、楽しみながらデザインのあれこれがわかる
            「なるほど！」と思える内容が盛りだくさんです！",
    rate: 7,
    user_id: 1
)

Post.create(
    title: "リーダブルコード",
    review: "美しいコードを見ると感動する。優れたコードは見た瞬間に何をしているかが伝わってくる。そういうコードは使うのが楽しいし、自分のコードもそうあるべきだと思わせてくれる。本書の目的は、君のコードを良くすることだ。",
    rate: 10,
    user_id: 1
)

Post.create(
    title: "スッキリわかるSQL入門 ドリル215問付き！",
    review: "豊富な図解とていねいな解説により、やさしく・楽しくデータベースとSQLを学習できる入門書です。巻末には215問のドリルを掲載。これを繰り返し解くことでSQLが着実に身に付きます。",
    rate: 8,
    user_id: 1
)


# Post.create(
#     title: "",
#     review: "",
#     rate: ,
#     user_id: 1
# )

# Category
Category.create(name: "Ruby")
Category.create(name: "Ruby on Rails")
Category.create(name: "Web")
Category.create(name: "SQL")
Category.create(name: "デザイン")
Category.create(name: "セキュリティ")
Category.create(name: "プログラミング")


