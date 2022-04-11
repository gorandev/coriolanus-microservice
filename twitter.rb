require 'yaml'
require 'json'
require 'typhoeus'

class Twitter

  attr_reader :search_url, :current_path, :tweets, :code

  def initialize
    current_path = File.expand_path('../config.yml', __FILE__)
    config = YAML.load(File.read(current_path))
    @bearer_token = config['twitter']['bearer_token']
    @search_url = config['twitter']['search_url']
    @max_tweets = config['twitter']['max_tweets']
  end

  def obtain topic
    self.create_query topic
    response = self.get_tweets(@search_url, @bearer_token, @query_params)

    @code = response.code
    @tweets = JSON.parse(response.body)
  end

  def create_query topic
    @query = "#{topic} (has:mentions OR -is:retweet)"
    @query_params = {
      "query": @query,
      "max_results": @max_tweets,
      "tweet.fields": "attachments,author_id,conversation_id,created_at,entities,id,lang",
      "user.fields": "description"
    }
    return @query
  end

  def get_tweets(url, bearer_token, query_params)
    options = {
      method: 'get',
      headers: {
        "User-Agent": "v2RecentSearchRuby",
        "Authorization": "Bearer #{@bearer_token}"
      },
      params: @query_params
    }

    request = Typhoeus::Request.new(url, options)
    response = request.run

    return response
  end

  def to_s
    "Twitter"
  end
end

=begin
t = Twitter.new
puts t.obtain "catupecumachu"
=end

