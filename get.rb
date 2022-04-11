require './save_tweets'

topic_tag = ARGV[0].sub('_', ' ')
result = SaveTweets.new(topic_tag)


