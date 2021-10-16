import tweepy
import pandas

#Keys as defined by the Twitter API
auth = tweepy.OAuthHandler(token1, token2)
auth.set_access_token(secret1, secret2)

api = tweepy.API(auth)

public_tweets = []

fh = open('enmi20/ids.txt', 'r')
tweets = fh.readlines()
fh.close

for tweet in tweets:
    print(tweet)
    try:
        public_tweets.append(api.get_status(tweet)._json)
    except tweepy.TweepError as te:
        with open('error.txt', 'a') as th:
            th.write(tweet + ' : ' + str(te))
        th.closed
        continue

df = pandas.json_normalize(public_tweets)
df.to_csv('enmi20/enmi.csv')
