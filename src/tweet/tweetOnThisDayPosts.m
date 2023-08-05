% Run on 2 hours interval to make tweet the articles 
% that were posted during the same time period in the previous years.
% 
% Copyright (c) 2023 Michio Inoue.

%% loading the post history data 
try
    dataset = readtable('postHistory.csv','TextType','string','DatetimeType','text','Delimiter',",");
    dataset.dates = datetime(dataset.date,'InputFormat','dd-MMM-uuuu HH:mm:SS', 'Locale', 'en_US');
catch ME
    disp("There is an issue with postHistory.csv")
    rethrow(ME)
end
disp("postHistory.csv is loaded");

%% When was the last checked date?
latestCheck = readcell('latestCheck.txt','Delimiter',',');
latestCheck = datetime(latestCheck,'InputFormat','dd-MMM HH:mm:SS', 'Locale', 'en_US');
latestCheck = latestCheck - calyears(year(latestCheck));
latestCheck.Format = "dd-MMM HH:mm:SS";
disp("last checked on " + string(latestCheck));

% Check the data from last checked till now.
tnow = datetime;
dates0 = dataset.dates - calyears(year(dataset.dates));
age = year(tnow) - year(dataset.dates);
dataset.age = age;

tdataset = table2timetable(dataset,"RowTimes",dates0);

newCheck = tnow-calyears(year(tnow));
trange = timerange(latestCheck,newCheck);
subdata = tdataset(trange,:);
subdata = subdata(subdata.age > 0,:);

% save new "latest check" time
newCheck.Format = "dd-MMM HH:mm:SS";
writematrix(newCheck,'latestCheck.txt')

if height(subdata) == 0
   disp("no post during this time frame: " ...
       + string(latestCheck) + " - " + string(newCheck));
   disp("Completed.")
   return;
else
   disp(height(subdata) + " items found during this time frame: " ...
       + string(latestCheck) + " - " + string(newCheck));
end


%% A function to generate a tweet string
string2tweet = @(age, title, url) ...
"["+string(age)+"年前の投稿] #matlab #simulink #onthisday" + newline ...
+ newline ...
+ title + newline ...
+ url;

%% Tweet if any with in the time period
tweetFlag = true;
N = height(subdata);
for ii=1:N
    str = string2tweet(subdata.age(ii), ...
        subdata.title(ii), subdata.url(ii));
    
    % Display Tweet sentense
    disp(str);
    
    if tweetFlag
        try
            disp("Tweeting " + ii + "/" + N + "..." + newline);
            % py.tweetQiita.tweetV2(str)
        catch ME
            disp(ME)
        end
    end
end

disp("Tweet completed.")
