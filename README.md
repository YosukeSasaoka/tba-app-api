# 土佐ビジネスアカデミー Nextremer API Server

位置情報アプリのサービス用Web APIを提供するための、Ruby on Rails製のアプリケーション。

# 開発手順 : Get Started

## Requirements

* ruby 2.2系 (2.2.4 or 2.2.5)
* bundler (ruby install時に自動でインストールされる)

## Windowsでのセットアップ

Ruby On Railsの環境構築
* ↓これを参考に進めてください（Ruby のインストールとDevKitのインストール）
* http://qiita.com/MToda/items/89147bd3712129bebf75
    * 上記を進めてエラーになった箇所
        * DevKitのインストールの「ruby dk.rb install」
        * 参考サイト： http://snoopopo.hatenablog.com/entry/2015/06/09/161603

bundlerをインストール
* gem install bundler
    * 実行時にエラーが出た場合は下記を参考に対応
        * 参考サイト： http://sutara79.hatenablog.com/entry/2016/10/15/205047
        * 項目： RubyGemsを最新版にする

Git をインストール
* ↓これを参考に進めてください
* https://utano.jp/entry/2016/07/git-for-windows-install/

### ここから先は先程インストールしたGit（Git Bashを選択）で実行
```bash
# Clone
git clone git@github.com:YosukeSasaoka/tba-app-api.git
cd tba-app-api
# 依存ライブラリインストール
# もしかしたら bundle update を実行しろと言われるかもしれません
bundle install --path vendor/bundle 
# サーバ起動
bundle exec rails s
# ブラウザでアクセス
http://localhost:3000/
# ↓が表示されれば完了
Yay! You’re on Rails!
```

## Macでのセットアップ
rbenvを使っている場合

下記のコマンド等でインストールしておくと良いと思います。

```
rbenv install 2.2.4
```

```bash
# Clone
git clone https://github.com/YosukeSasaoka/tba-app-api.git
cd tba-app-api
# bundleをインストール
gem install bundler
# 依存ライブラリインストール
# もしかしたら bundle update を実行しろと言われるかもしれません
bundle install --path vendor/bundle
# サーバ起動
bundle exec rails s
# ブラウザでアクセス
http://localhost:3000/
# ↓が表示されれば完了
Yay! You’re on Rails!
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