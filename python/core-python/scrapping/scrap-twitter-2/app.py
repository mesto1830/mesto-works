import snscrape.modules.twitter as sntwitter
import pandas as pd
from time import sleep
import json
myData = []

username = input('Enter username: ')
number = int(input('How many tweets do you want to scrape: '))

for i, tweets in enumerate(sntwitter.TwitterSearchScraper('{}'.format(username)).get_items()):
  if i > number:
    break
  myData.append([tweets.likeCount,tweets.content,tweets.user.username,tweets.url])

df = pd.DataFrame(myData,columns=['likeCount','Tweets','Username','Url'])
df.to_csv(f'{username}.csv',index=False,encoding='utf-8')