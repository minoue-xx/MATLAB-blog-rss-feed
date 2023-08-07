% Post history is saved on postHistory.csv for a new entry
% This script to add previous posts to postHistory.csv (done in 2023/8/7)
% 
% The previous posts listed on
% https://minoue-xx.github.io/MATLAB-blog-rss-feed/blogs/ will be
% processed. Please note that this is not all on each blog.
%
% Post list for each blog in HTML format is saved on ./blogs folder.
% Copyright (c) 2023 Michio Inoue.
%
% Blog list as of 2023/8/7
% ['matlab - kentaPtの日記', 'https://kentapt.hatenablog.com/rss/category/matlab'],
% ['leftbank - note:MATLAB 関連', 'https://note.com/leftbank/m/m088894fecb57/rss'],
% ['Matlab - komajou’s diary','https://komajou.hatenablog.jp/rss/category/Matlab'],
% ['MATLAB - Zenn','https://zenn.dev/topics/matlab/feed'],
% ['無料教材：matlab - 理系大学教員の本気ブログ',encodeURI('https://forfree.hatenablog.jp/rss/category/無料鋼材：matlab')],
% ['MATLABパイセンが教える振動・騒音・音響・機械工学','https://mech-eng-uni.com/feed/'],
% ['MATLAB - めっくろぐ','https://mechlog.hateblo.jp/rss/category/MATLAB'],
% ['MATLAB - MyEnigma','https://myenigma.hatenablog.com/rss/category/MATLAB'],
% ['MATLAB - Radi_tech’s blog','https://radi-tech.hatenablog.com/rss/category/MATLAB%20%5BJapanese%5D'],
% ['Matlab - Gohey Blog','https://gohey.net/category/code/matlab/feed/'],
% ['MathWorks 公式','https://blogs.mathworks.com/japan-community/feed/'],
% ['MATLAB - Qiita','https://qiita.com/tags/matlab/feed.atom'],
% ['センチメンタルラボ','https://matlab-study.sakura.ne.jp/blog/?cat=53&feed=rss2'],
% ['MATLAB - ふみきりのぼうけん','https://fumikirinobouken.hatenablog.com/feed/category/Matlab'],
% ['MATLAB/Simulink - 映画と旅行とエンジニア','https://wakky.tech/category/matlab-simulink/feed/'],
% ['MATLAB/Simulink - しろねこらぼ',encodeURI('https://sironekolab.com/archives/category/プログラミング/matlab-simulink/feed')],
% ['流体シミュレーション - N’s note','https://taku-naka.site/category/computational-thermo-fluid-dynamics/feed/'],
% ['Sachie - MATLAB アカデミックニュースレター','https://note.com/sachie_y/m/mca72ce231fdc/rss'],
% ['MATLAB - 東京工業大学 ロボット技術研究会公式ブログ','https://blog.rogiken.org/blog/tag/matlab/feed/'],
% ['MATLAB - とあるソフトウェアエンジニアのつぶやき','https://toarusw.com/category/matlab/feed/'],
% ['ProAlgorithm','https://pro-algorithm.com/feed/'],
% ['MATLAB - techBrowse','https://tech-browse.com/tag/matlab/feed/'],
% ['MATLAB - controlabo','https://controlabo.com/category/matlab/feed/'],
% ['MATLAB - ホームメードガービッジ 家族４人のおもしろてづくりブログ','https://homemadegarbage.com/tag/matlab/feed/'],

%%
folderInfo = dir('blogs'); % all files
 % exclude a file
folderInfo = folderInfo(cellfun(@(x) x == 1, {folderInfo.isdir}));
 % exclude a parent folder
folderInfo = folderInfo(cellfun(@(x) length(x)>2, {folderInfo.name}));

% issue with センチメンタルラボ 14 (url being the same for every post)
postData = [];
for ii=1:length(folderInfo)
    filename = fullfile(folderInfo(ii).folder,folderInfo(ii).name,"index.html");
    postData = [postData; getPostData(filename)];
end


% format example
% pubData: "2023-03-1102:42:49"
postData.pubDate = datetime(postData.pubDate,'InputFormat','uuuu-MM-ddHH:mm:SS', 'Locale', 'en_US');
postData.date = postData.pubDate;
postData.date.Format = 'dd-MMM-uuuu HH:mm:ss';
postData.pubDate.Format = 'eee, dd MMM uuuu HH:mm:ss ''GMT''';
postData = convertvars(postData,@isdatetime,"string");
postData.title = postData.title + " | " + postData.blogTitle;

%% Output as pastPosts_ver1.csv
% Format
% Varnames: date, title, url, pubData
% Ex. "01-Apr-2020 00:32:26", title | blogname, url, "Wed, 01 Apr 2020 00:32:26 GMT"
writetable(postData(:,["date","title","url","pubDate"]),'../pastPosts_ver1.csv');


function postdata = getPostData(filename)

    code = join(readlines(filename));
    % code = replace(code," ",""); 
    % number of spaces are inconsistent, delete all.
    % use pattern instead for space

    pat1 = regexpPattern('<div\s*class="ui-feed-item"><a'); 
    pat2 = regexpPattern('前\s*</div>'); 
    code1 = extractBetween(code,pat1,pat2);

    pat1 = regexpPattern('class="ui-feed-item__og-image"\s*href="'); 
    pat2 = regexpPattern('">'); 
    url = extractBetween(code1,pat1,pat2);

    title = extractBetween(code1,'class="ui-feed-item__title','</a>');
    title = extractAfter(title,'>');

    pat1 = regexpPattern('class="ui-feed-item__date"\s*title="');
    pat2 = regexpPattern('">'); 
    pubDate = extractBetween(code1,pat1,pat2);
    blogTitle = extractBetween(string(code1),'class="ui-feed-item__blog-title">','</div>');

    postdata = table(title,url,pubDate,blogTitle);
end