import snscrape.modules.twitter as twitterScraper
import json

scraper = twitterScraper.TwitterUserScraper("fatmasahin")
tweets = []
for i, tweet in enumerate(scraper.get_items()):
  if i > 5:
    break
  tweets.append({
    "id":tweet.id,
    "rawContent":tweet.rawContent,
    "Likes":tweet.likeCount,
    "ReplyCount":tweet.replyCount,
    "RetweetCount":tweet.retweetCount
  })

file = open("tweets.json","w")
result = json.dumps(tweets)
file.write(result)
file.close()


# scraper2 = twitterScraper.TwitterSearchScraper("fatmasahin").get_items()
# tweets = []
# tweets2 = []
# for i, tweet in enumerate(scraper2):
#   if i > 15:
#     break
#   tweets2.append(tweet)
#   tweets.append({
#     "id":tweet.id,
#     "date":tweet.date,
#     "rawContent":tweet.rawContent,
#     "Likes":tweet.likeCount,
#     "ReplyCount":tweet.replyCount,
#     "RetweetCount":tweet.retweetCount,
#     "favouritesCount":tweet.user.favouritesCount,
#     "followersCount":tweet.user.followersCount,
#   })
# print(tweets2)

# file = open("tweets.json","w")
# result = json.dumps(tweets, default=str)
# file.write(result)
# file.close()