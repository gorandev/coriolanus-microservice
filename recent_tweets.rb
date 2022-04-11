=begin
active record model
=end
require './tweet'

=begin
twiter libraries get the interface with Twitter
=end
require './twitter'


class StorageTweets
    def initialize topic
        @topic = topic
        tweets = Twitter.new
        @response = tweets.obtain @topic
        self.clean
        self.storage
    end

    protected
    def clean
        Tweet.where(topic: @topic).destroy_all
    end

    def storage
        @response["data"].each do |tweet|
            storage = Tweet.new
            storage.autor_id = tweet["author_id"] || "empty"
            storage.topic = @topic
            storage.attachments = tweet["attachments"]
            storage.text = tweet["text"]
            storage.save
        end
    end
end

topic = ARGV[0].sub('_', ' ')
storage = StorageTweets.new(topic)


