# Copyright (c) 2023 Michio Inoue
def tweetV2(status):

    # https://www.jcchouinard.com/post-on-twitter-api-with-python/
    # importing all dependencies
    import tweepy
    import os
    from os import getenv
        
    #Define your keys from the developer portal
    api_key = getenv('API_KEY')
    api_key_secret = getenv('API_KEY_SECRET')
    access_token = getenv('ACCESS_TOKEN')
    access_token_secret = getenv('ACCESS_TOKEN_SECRET') 

    # Twitter Deverloper Portalで取得
    client = tweepy.Client(consumer_key=api_key, consumer_secret=api_key_secret, access_token=access_token, access_token_secret=access_token_secret)
    client.create_tweet(text=status)
