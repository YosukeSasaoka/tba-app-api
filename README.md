
# 土佐ビジネスアカデミー Nextremer API Server

位置情報アプリのサービス用Web APIを提供するための、Ruby on Rails製のアプリケーション。



# 開発手順 : Get Started

## Requirements

* ruby 2.3 (2.3.0)
* bundler (ruby install時に自動でインストールされる)

#### rbenvを使っている場合

下記のコマンド等でインストールしておくと良いと思います。

```
rbenv install 2.3.0
```

## セットアップ

```bash
# Clone
git clone git@github.com:Nextremer/piculetly-api-server.git
cd piculetly-api-server
# 依存ライブラリインストール
# もしかしたら bundle update を実行しろと言われるかもしれません
bundle install --path vendor/bundle 
# DBマイグレーション
~~bundle exec rake db:migrate~~
~~bundle exec rake db:seed~~
# サーバ起動
bundle exec rails s -b 0.0.0.0
```

サーバが起動したら、APIドキュメントにアクセスしましょう.

```
~~http://localhost:3000/docs~~
```

# 開発ルール

* パラメータはキャメルケースで受け取って、レスポンスもキャメルケースで返す
    * rubyはスネーク、jsはキャメルで書くのが普通。サーバ側がクライアントに合わせる。
* テストを書くなら壊さないでおくこと。保守できていないテストは書いてない方が良い。

# 最新の取得

```bash
git pull origin master
# 依存ライブラリが増えている場合
bundle install
# DBに追加がある場合
bundle exec rake db:migrate
# サーバ起動
bundle exec rails s
```


# その他ヒント諸々

## メインの依存ライブラリ

* [Grape](https://github.com/intridea/grape) : Ruby製のWebAPI作成フレームワーク
* [grape-swagger](https://github.com/tim-vandecasteele/grape-swagger) : Grapeベースで記述されたAPIのドキュメント自動生成ツール
* [Pry](https://github.com/rweng/pry-rails) : デバッグツール. `rails c`もパワーアップ.
    * [Pryを使ってRailsのコンソールをパワーアップ&デバッグをする](http://ruby-rails.hatenadiary.com/entry/20141024/1414081224)
* [Rails Admin](https://github.com/sferik/rails_admin) : 管理画面の動的自動生成
    * [Rails4にrails_adminを導入して綺麗な管理画面が出来るまで](http://tagamidaiki.com/introduce-rails-admin-to-rails4/)

#### DBをまっさらにしたい

```bash
bundle exec rake db:drop db:create db:migrate db:seed
```