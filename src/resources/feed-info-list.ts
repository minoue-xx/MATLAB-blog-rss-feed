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
  ['MATLABパイセンが教える振動・騒音・音響・機械工学','https://mech-eng-uni.com/category/matlab/feed/'],
  ['MATLAB - めっくろぐ','https://mechlog.hateblo.jp/rss/category/MATLAB'],
  ['MATLAB - MyEnigma','https://myenigma.hatenablog.com/rss/category/MATLAB'],
  ['MATLAB - Radi_tech’s blog','https://radi-tech.hatenablog.com/rss/category/MATLAB%20%5BJapanese%5D'],
  ['Matlab - Gohey Blog','https://gohey.net/category/code/matlab/feed/'],
  ['MathWorks 公式','https://blogs.mathworks.com/japan-community/feed/?from=jp'],
  ['MATLAB - Qiita','https://qiita.com/tags/matlab/feed.atom'],
  ['センチメンタルラボ','https://matlab-study.sakura.ne.jp/blog/?cat=53&feed=rss2'],
  ['MATLAB - ふみきりのぼうけん','https://fumikirinobouken.hatenablog.com/feed/category/Matlab'],
  ['MATLAB/Simulink - 映画と旅行とエンジニア','https://wakky.tech/category/matlab-simulink/feed/'],
  ['MATLAB/Simulink - しろねこらぼ',encodeURI('https://sironekolab.com/archives/category/プログラミング/matlab-simulink/feed')],
  ['流体シミュレーション - N’s note','https://taku-naka.site/category/computational-thermo-fluid-dynamics/feed/'],
  ['Sachie - MATLAB アカデミックニュースレター','https://note.com/sachie_y/m/mca72ce231fdc/rss'],
  ['MATLAB - 東京工業大学 ロボット技術研究会公式ブログ','https://blog.rogiken.org/blog/tag/matlab/feed/'],
  ['MATLAB - とあるソフトウェアエンジニアのつぶやき','https://toarusw.com/category/matlab/feed/'],
  ['ProAlgorithm','https://pro-algorithm.com/feed/'],
  ['MATLAB - techBrowse','https://tech-browse.com/tag/matlab/feed/'],
  ['MATLAB - controlabo','https://controlabo.com/category/matlab/feed/'],
  ['MATLAB - ホームメードガービッジ 家族４人のおもしろてづくりブログ','https://homemadegarbage.com/tag/matlab/feed/'],
  ['MATLAB - 粗大メモ置き場','https://ossyaritoori.hatenablog.com/rss/category/matlab'],
  ['MATLAB - 三次のおやつブログ','https://tonakai1070.com/category/matlab/feed']
]);

/**
 * その他候補
 * MATLAB tag と投稿の重複があるとエラー
 * ['Simulink - Qiita','https://qiita.com/tags/simulink/feed'],
 *
 * Unknown Error..
 * ['プログラム-MATLAB - lm4183’s blog',encodeURI('https://lm4183.hateblo.jp/rss/category/プログラム-MATLAB')],
 * ['MATLABの本棚','http://blog.syoubook.info/index.rdf'],
 * ['スムーズワークス日想','http://blog.smooth-works.net/archives/tag/sl_pg_basic/feed'],
 *
 * フィードなし
 * ['PLATEK - TECH ブログ','https://www.paltek.co.jp/techblog/tag/simulink'],
 * 
 * MATLAB/Simulink に関係するが tag 等で分類できない
 * ['IDAJ','https://www.idaj.co.jp/blog/category/software'],
 *
 * 最近アップデート無し
 * 
 * 日本語以外
 */
