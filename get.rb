=begin
active record model
=end
require './tweet'

=begin
twiter libraries get the interface with Twitter
=end
require './twitter'


class StorageTweets
    def initialize topic_tag
        @topic =  self.get_topic topic_tag
        tweets = Twitter.new
        @response = tweets.obtain topic_tag
        self.clean
        self.storage
    end

    protected

    def get_topic topic_name
        topic = Topic::find_by({'name': topic_name})
        if not topic
            topic = Topic::create({'name': topic_name})
        end
        topic
    end

    def clean
        Tweet.where(topic: @topic).destroy_all
    end

    def storage
        @response["data"].each do |tweet|
            storage = Tweet.new
            storage.autor_id = tweet["author_id"] || "empty"
            storage.lang = tweet["lang"] || "empty"
            storage.topic = @topic
            storage.attachments = tweet["attachments"]
            storage.conversation_id = tweet["conversation_id"] || "empty"
            storage.text = tweet["text"]
            storage.save
        end
    end
end

topic_tag = ARGV[0].sub('_', ' ')
storage = StorageTweets.new(topic_tag)


