% This is a script to generate the list of posts by leftbank-san.
% Copyright (c) 2023 Michio Inoue.
code = webread("http://www.remus.dti.ne.jp/~leftbank/etc/noteMag_MATLAB.html");

% Process html
tree = htmlTree(code);
subtrees = findElement(tree,"A");

attr = "href";
% URL of each post
url = getAttribute(subtrees,attr);
% Title of each post
title = extractHTMLText(subtrees);

% Date of each post
% "<DIV>↵    No.055 (2023/07/30)<BR/>↵  </DIV>"
selector = "DIV";
subtrees = findElement(tree,selector);
% convert to string to extract dates
strs = string(subtrees);
idx = contains(strs,"No.");
date = strs(idx);
date = extractBetween(date,"(",")");
date = datetime(date);
date.Format = "dd-MMM-uuuu HH:mm:SS";
date = date + hours(19); % suppose it's all posted at 7pm (JST)

%  | MATLAB関連
%%
% format example
% pubData: "2023-03-11 02:42:49"
pubDate = date;
pubDate.Format = 'eee, dd MMM uuuu HH:mm:ss ''GMT''';
postData = table(date,title,url,pubDate);
postData = convertvars(postData,@isdatetime,"string");
postData.title = postData.title + " | MATLAB関連";


%% Add to pastPosts_ver1.csv
% Format
% Varnames: date, title, url, pubData
% Ex. "01-Apr-2020 00:32:26", title | blogname, url, "Wed, 01 Apr 2020 00:32:26 GMT"

dataset = readtable('../postHistory.csv','TextType','string','DatetimeType','text','Delimiter',",");
pastDataset = readtable('../pastPosts_ver1.csv','TextType','string','DatetimeType','text','Delimiter',",");

% delete contens exist on pastPosts_ver1.csv
Lia = ismember(postData.url,pastDataset.url);
post2add = postData(~Lia,["date","title","url","pubDate"]);
post2output = [pastDataset; post2add];

% delete contents exist on postHistory.csv
Lia = ismember(post2output.url,dataset.url);

writetable(post2output(~Lia,:),'../pastPosts_ver1.csv');


