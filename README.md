# <img src="src/site/images/icon-transparent.png" height=26> MATLAB 関連ブログRSS  
MATLAB/Simulink に関するブログ更新をまとめたRSSフィードを配信しています。
MATLAB の使い方・MATLAB を使った新しいアイデアのヒントが得られますように。

[https://minoue-xx.github.io/tech-blog-rss-feed/](https://minoue-xx.github.io/tech-blog-rss-feed/)

[@yamadashy](https://github.com/yamadashy)さんの作成された[yamadashy/tech-blog-rss-feed](https://github.com/yamadashy/tech-blog-rss-feed)をベースにカスタムしております。

## サイト追加の方針
MATLAB/Simulink に関するブログ（技術ブログ、エンジニアブログ）であれば基本的には追加させてください。


## サイトの追加方法
[src/resources/feed-info-list.ts](https://github.com/minoue-xx/tech-blog-rss-feed/blob/main/src/resources/feed-info-list.ts) で管理しており、その一覧にない場合 issue を作っていただければ対応します。  

### プルリクでの送り方
もしプルリクを送っていただける場合は以下のように作成できます。

1. このリポジトリをフォーク
2. ブランチ作成  
   `git checkout -b new-blog-feed-xxx`
3. フィードを追加  
   `src/resources/feed-info-list.ts` の `FEED_INFO_LIST` を更新
4. コミット  
   `git commit -am 'add: 新規フィード追加`
5. プッシュ  
   `git push origin new-blog-feed-xxx`
6. プルリクを作成


## 
## 仕組み
GitHub Actions で定期的に更新されており、サイトの生成は [Eleventy](https://www.11ty.dev/) を使用しています。

更新は多少遅延ありますが以下のタイミングで行います。
- 平日 8時-24時の1時間おき
- 休日 8時-24時の2時間おき

## ライセンス
MIT
