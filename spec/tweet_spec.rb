require 'support/spec_helper'

describe Twitter::Tweet do
  let(:screen_name) { 'elgalu' }
  let(:latest_tweet_text)  { /Console Ruby debug is easy/ }
  let(:url) { "http://api.twitter.com/1/statuses/user_timeline.json?screen_name=#{screen_name}&count=1" }

  let(:client) { Twitter::Client.new }
  let(:tweets) { client.user_timeline(screen_name, count: 1) }
  let(:first_tweet) { tweets.first }

  before do
    WebMock.reset!
    stub_request(:get, url).to_return(:body => fixture("#{screen_name}_statuses.json"))
  end

  context 'first tweet' do
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

    it 'should respond to status_url' do
      first_tweet.should respond_to(:status_url)
    end

    it 'should contain proper text' do
      first_tweet.should respond_to(:text)
      first_tweet.text.should match(latest_tweet_text)
    end

    it 'should produce a status url' do
      first_tweet.status_url.should == "https://twitter.com/elgalu/status/307606752055148545"
    end
  end
end
