require 'minitest/autorun'
require './twitter'

class TestTwitter < Minitest::Test
  def setup
    @twitter = Twitter.new
  end

  def test_creation_of_twitter
    assert_equal "Twitter", @twitter.to_s
  end

  def test_create_query
    topic = "nasa"
    assert_equal "#{topic} has:mentions", @twitter.create_query(topic)
  end

  def test_obtain_tweets
    topic = "picasso"
    @twitter.obtain topic
    assert_equal 200, @twitter.code
  end

=begin
  def test_credentials_of_twitter
    refute_empty @twitter.bearer_token
    refute_empty @twitter.search_url
  end
=end
end
