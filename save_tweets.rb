=begin
active record model
=end
require './tweet'

=begin
twiter libraries get the interface with Twitter
=end
require './twitter'

class SaveTweets
    attr_reader :topic, :response

    def initialize topic_tag
        @topic =  self.get_topic topic_tag
        tweets = Twitter.new
        @response = tweets.obtain topic_tag
        self.clean
        self.save
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

    def save
        @response["data"].each do |tweet|
            storage = Tweet.new
            storage.author_id = tweet["author_id"] || "empty"
            storage.lang = tweet["lang"] || "empty"
            storage.topic = @topic
            storage.attachments = tweet["attachments"]
            storage.conversation_id = tweet["conversation_id"] || "empty"
            storage.text = tweet["text"]
            storage.save
        end
    end
end
