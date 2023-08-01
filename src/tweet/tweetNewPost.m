% Copyright (c) 2023 The MathWorks, Inc.
try
    xDoc = xmlread('https://minoue-xx.github.io/MATLAB-blog-rss-feed/feeds/rss.xml');

    % まず各投稿は <item></item>
    allListitems = xDoc.getElementsByTagName('item');

    %%
    % アイテム数だけ配列を確保
    title = strings(allListitems.getLength,1);
    url = strings(allListitems.getLength,1);
    pubDate = strings(allListitems.getLength,1);

    % 各アイテムから title, url, author 情報を出します。
    for k = 0:allListitems.getLength-1
        thisListitem = allListitems.item(k);

        % Get the title element
        thisList = thisListitem.getElementsByTagName('title');
        thisElement = thisList.item(0);
        % The text is in the first child node.
        title(k+1) = string(thisElement.getFirstChild.getData);

        % Get the link element
        thisList = thisListitem.getElementsByTagName('link');
        thisElement = thisList.item(0);
        % The url is one of the attributes
        url(k+1) = string(thisElement.getFirstChild.getData);

        % Get the author element
        thisList = thisListitem.getElementsByTagName('pubDate');
        thisElement = thisList.item(0);
        pubDate(k+1) = string(thisElement.getFirstChild.getData);
    end
    % pubDate is in the following format
    % Fri, 21 Jul 2023 13:15:08 GMT
    tmp = extractBetween(pubDate,", "," GMT");
    date = datetime(tmp,'InputFormat','dd MMM uuuu HH:mm:SS', 'Locale', 'en_US');

catch ME
    disp(ME)
    FailAnswersRead = true; % 読み込み失敗
    return;
end

%% save post history

post = table(date,title,url,pubDate);
post.date = string(post.date)
post_old = readtable('postHistory.csv','TextType','string','DatetimeType','text','Delimiter',",")
last_updated = max(datetime(post_old.date,'InputFormat','dd-MMM-uuuu HH:mm:SS', 'Locale', 'en_US'))

post = union(post,post_old,'rows')
writetable(post,'postHistory.csv');
%%
% 新着かどうかのチェック
% このスクリプトは 2時間に1回実行する設定にします。(GitHub Action)
% なので、、現時刻から2時間以内に投稿されていればそれは新着記事とします。
% interval = duration(2,0,0);
% tnow = datetime;
% tnow.TimeZone = 'UTC';

% trange = timerange(tnow-interval,tnow); % interval 以内の投稿だけを抽出
% newitem_list = post(trange,:)
last_updated
datetime(post.date,'InputFormat','dd-MMM-uuuu HH:mm:SS', 'Locale', 'en_US')

idx = datetime(post.date,'InputFormat','dd-MMM-uuuu HH:mm:SS', 'Locale', 'en_US') > last_updated;
newitem_list = post(idx,:)
%%

tweetFlag = true;
% 新着の数だけ呟きます（無ければ呟かない）
for ii=1:height(newitem_list)

    % 投稿文
    status = "新着！#MATLAB #Simulink ブログ" + newline;
    status = status + "「" + newitem_list.titles(ii) + "」" + newline;
    status = status + newitem_list.urls(ii);
    disp(status);

    if tweetFlag
        try
            py.tweetBlogMATLAB.tweetV2(status)
        catch ME
            disp(ME)
        end
    end
end
