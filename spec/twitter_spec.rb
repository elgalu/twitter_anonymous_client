require 'spec_helper'

require 'twitter_anonymous_client'

describe Twitter::Client, 'user_timeline' do
  let(:screen_name) { 'elgalu' }
  let(:latest_tweet_text)  { /Console Ruby debug is easy/ }
  let(:url) { "http://api.twitter.com/1/statuses/user_timeline.json?screen_name=#{screen_name}&count=1" }

  let(:client) { Twitter::Client.new }
  let(:tweets) { client.user_timeline(screen_name, count: 1) }
  let(:first_tweet) { tweets.first }

  before do
    stub_request(:get, url).to_return(:body => fixture("#{screen_name}_statuses.json"))
  end

  describe 'tweets' do
    it ':get request should have been made' do
      tweets
      expect(a_request(:get, url)).to have_been_made
    end

    it 'should be an Array' do
      expect(tweets).to be_an(Array)
    end

    it 'count should be 1' do
      tweets.size.should be(1)
    end
  end

  describe 'first tweet' do
    it 'should be a Tweet' do
      first_tweet.should be_a(Twitter::Tweet)
    end

    it 'should respond to id' do
      first_tweet.should respond_to(:id)
    end

    it 'should respond to text' do
      first_tweet.should respond_to(:text)
    end

    it 'should respond to created_at' do
      first_tweet.should respond_to(:created_at)
    end

    it 'should contain proper text' do
      first_tweet.should respond_to(:text)
      first_tweet.text.should match(latest_tweet_text)
    end
  end

end
