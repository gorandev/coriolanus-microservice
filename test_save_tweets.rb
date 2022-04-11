require 'minitest/autorun'
require './save_tweets.rb'

class TestSaveTweets < Minitest::Test
  def setup
    @st = SaveTweets.new "example"
    @topic = @st.topic
    @tweets = @st.response
  end

  def test_save_answer
    assert_match "SaveTweets", @st.to_s
  end

  def test_check_topic
    assert_equal "example", @topic.name
  end

  def test_twitter_answer
    assert_equal Hash, @tweets.class
  end
end
