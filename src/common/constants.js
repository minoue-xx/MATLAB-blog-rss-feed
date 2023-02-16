const siteUrlStem = 'https://minoue-xx.github.io/MATLAB-blog-rss-feed';
const siteUrl = `${siteUrlStem}/`;

module.exports = {
  // サイト設定
  siteUrl: `${siteUrl}`,
  siteUrlStem: siteUrlStem,
  siteTitle: 'MATLAB 関連ブログ RSS',
  siteDescription:
    'MATLAB/Simulink に関するブログの更新をまとめたRSSフィードを配信しています。MATLAB の使い方・MATLAB を使った新しいアイデアのヒントが得られますように。',
  siteDescriptionFeed1: 'MATLAB 関連の更新をまとめた',
  siteDescriptionFeed2: 'RSSフィードを配信しています',

  // フィード設定
  feedTitle: 'MATLAB 関連ブログ RSS',
  feedDescription: 'MATLAB に関するブログの更新をまとめたRSSフィード',
  feedLanguage: 'ja',
  feedCopyright: 'minoue-xx/MATLAB-blog-rss-feed',
  feedGenerator: 'minoue-xx/MATLAB-blog-rss-feed',
  feedUrls: {
    atom: `${siteUrl}feeds/atom.xml`,
    rss: `${siteUrl}feeds/rss.xml`,
    json: `${siteUrl}feeds/feed.json`,
  },

  // GitHub
  author: 'minoue',
  gitHubUserUrl: 'https://github.com/minoue-xx/',
  gitHubRepositoryUrl: 'https://github.com/minoue-xx/MATLAB-blog-rss-feed/',

  // Google Analytics系。フォークして使う際は値を空にするか書き換えてください
  // googleSiteVerification: 'GPLvXv8kYtLMW912ZS54DKFEZL6ruOrjOFLdHVTo37o',
  // globalSiteTagKey: 'G-CNNNTL0NB3',
  googleSiteVerification: '',
  globalSiteTagKey: '',

  // フィードの取得などに使う UserAgent
  requestUserAgent: 'facebookexternalhit/1.1; minoue-xx/MATLAB-blog-rss-feed',

  // サイトの追加方法のリンク
  howToAddSiteLink:
    '',
};
