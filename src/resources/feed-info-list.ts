export type FeedInfo = {
  label: string;
  url: string;
};

const createFeedInfoList = (feedInfoTuples: [label: string, url: string][]) => {
  const feedInfoList: FeedInfo[] = [];

  for (const [label, url] of feedInfoTuples) {
    feedInfoList.push({ label, url });
  }

  return feedInfoList;
};

// フィード情報一覧。アルファベット順
export const FEED_INFO_LIST: FeedInfo[] = createFeedInfoList([
  // ['企業名・製品名など', 'RSS/AtomフィードのURL'],
  ['matlab - kentaPtの日記', 'https://kentapt.hatenablog.com/rss/category/matlab'],
  ['leftbank - note:MATLAB 関連', 'https://note.com/leftbank/m/m088894fecb57/rss'],
  ['Matlab - komajou’s diary','https://komajou.hatenablog.jp/rss/category/Matlab'],
  ['MATLAB - Zenn','https://zenn.dev/topics/matlab/feed'],
  ['無料教材：matlab - 理系大学教員の本気ブログ',encodeURI('https://forfree.hatenablog.jp/rss/category/無料鋼材：matlab')],
  ['MATLABパイセンが教える振動・騒音・音響・機械工学','https://mech-eng-uni.com/feed/'],
  ['MATLAB - めっくろぐ','https://mechlog.hateblo.jp/rss/category/MATLAB'],
  ['MATLAB - MyEnigma','https://myenigma.hatenablog.com/rss/category/MATLAB'],
  ['MATLAB - Radi_tech’s blog','https://radi-tech.hatenablog.com/rss/category/MATLAB%20%5BJapanese%5D'],
  ['Matlab - Gohey Blog','https://gohey.net/category/code/matlab/feed/'],
  ['MathWorks 公式','https://blogs.mathworks.com/japan-community/feed/'],
  ['MATLAB - Qiita','https://qiita.com/tags/matlab/feed.atom'],
]);

/**
 *  ['MATLAB - Qiita','https://qiita.com/tags/matlab/feed'],
 *  ['Simulink - Qiita','https://qiita.com/tags/simulink/feed'],
 * その他候補
 *
 * できたばかりなので様子見
 * ['Amayz', 'https://blog.amayz.co.jp/?feed=rss2'],
 *
 * パースエラー修正
 * ['Qiita', 'https://zine.qiita.com/'],
 * ['サイバーディフェンス研究所', 'https://io.cyberdefense.jp/index.xml'],
 *
 * 日本語以外が交じるのを解消できたら入れたい
 * ['クラスメソッド', 'https://dev.classmethod.jp/feed'],
 *
 * 技術のカテゴリ切られてないので悩ましい
 * ['Ragate', 'https://www.ragate.co.jp/blog/'],
 *
 * 403 Forbidden
 * ['Cygames', 'https://tech.cygames.co.jp/feed/'],
 * ['AI Shift', 'https://www.ai-shift.co.jp/techblog/feed'],
 * ['BRANU', 'https://tech.branu.jp/feed'],
 *
 * 404
 * ['リクルートデータ', 'https://blog.recruit.co.jp/data/index.json'],
 * ['Findy Teams', 'https://engineering-org.findy-teams.com/feed.xml'],
 * ['KINTOテクノロジーズ', 'https://blog.kinto-technologies.com/feed.xml'],
 * ['テリロジー', 'https://terilogy-tech.hatenablog.com/feed'],
 * ['ヘイ データチーム', 'https://data.hey.jp/feed'],
 *
 * 406
 * ['AsiaQuest', 'https://techblog.asia-quest.jp/rss.xml'],
 * ['Supership', 'https://www.wantedly.com/stories/s/Supership/rss.xml'],
 * ['Wantedly', 'https://www.wantedly.com/stories/s/wantedly_engineers/rss.xml'],
 *
 * 500
 * ['LIG', 'https://liginc.co.jp/technology/feed'],
 *
 * 503
 * ['フクロウラボ', 'https://developers.fukurou-labo.co.jp/feed/'],
 *
 * Error: unable to verify the first certificate
 * ['スペースマーケット', 'https://blog.spacemarket.com/category/code/feed/'],
 * ['エムアールピー', 'https://mrp-net.co.jp/tech_blog/feed'],
 *
 * pubDate なし
 * ['リクルート', 'https://engineers.recruit-jinji.jp/techblog/feed/']
 *
 * 削除された？
 * ['NAXA', 'https://blog.naxa.co.jp/feed'],
 * ['Reigle', 'https://www.reigle.info/feed'],
 * ['HiTTO', 'https://product-blog.hitto.co.jp/feed'],
 *
 * フィードなし。スクレイピング？
 * https://lab.mo-t.com/blog
 * https://tech-blog.sweeep.ai/
 * https://minedia-engineer-hub-minedia.vercel.app/
 * https://segaxd.co.jp/news/?category=blog
 * https://tech.smartshopping.co.jp/
 * https://olaris.jp/category/technology
 * https://licensecounter.jp/engineer-voice/blog/
 * https://tech.ilovex.co.jp/
 * https://developer.nvidia.com/ja-jp/blog/
 * https://www.vision-c.co.jp/engineerblog
 * https://www.cresco.co.jp/blog/
 * https://blog.genda.jp/creators/
 * https://lab.hokadoko.com/news/RTEPiK54
 * https://subthread.co.jp/blog/
 *
 * 日本語以外
 * https://medium.com/feed/mcdonalds-technical-blog
 * https://netflixtechblog.com/
 * https://discord.com/blog/
 * https://www.twilio.com/blog
 *
 * TODO: スライド系も追加？
 * https://speakerdeck.com/line_developers
 *   ['mechlog', 'https://mechlog.hateblo.jp/rss/category/MATLAB'],
 *  ['kentaPT', 'https://kentapt.hatenablog.com/rss/category/matlab'],
 *  ['komajou','https://komajou.hatenablog.jp/rss/category/Matlab'],
 *  ['MATLAB Answers','https://www.google.com/alerts/feeds/11315963722746074532/8867917472632701526'],
 */
