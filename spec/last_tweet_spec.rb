require 'support/spec_helper'

describe Twitter::Client do
  let(:screen_name) { 'elgalu' }
  let(:latest_tweet_text)  { /Console Ruby debug is easy/ }
  let(:url) { "http://api.twitter.com/1/statuses/user_timeline.json?screen_name=#{screen_name}&count=1" }

  let(:client) { Twitter::Client.new }
  let(:last_tweet) { client.last_tweet(screen_name) }

  before do
    WebMock.reset!
    stub_request(:get, url).to_return(:body => fixture("#{screen_name}_statuses.json"))
  end

  describe '#last_tweet' do
    it 'should be a Tweet' do
      last_tweet.should be_a(Twitter::Tweet)
    end

    it 'should respond to id' do
      last_tweet.should respond_to(:id)
    end

    it 'should contain proper text' do
      last_tweet.should respond_to(:text)
      last_tweet.text.should match(latest_tweet_text)
    end

    it 'should produce a status url' do
      last_tweet.status_url.should == "https://twitter.com/elgalu/status/307606752055148545"
    end
  end
end
