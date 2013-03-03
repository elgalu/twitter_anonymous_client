require 'support/spec_helper'

describe Twitter::Client do
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

  context 'when no internet connection' do
    before do
      WebMock.reset!
      WebMock.disable_net_connect!
    end

    after do
      WebMock.allow_net_connect!
    end

    describe '#get' do
      it 'writes to $stderr the error messages' do
        expect { tweets }.to raise_error(Twitter::Client::ConnectionError)
      end
    end
  end

  describe '#user_timeline' do

    context 'tweets' do
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

      it 'should contain proper text' do
        first_tweet.should respond_to(:text)
        first_tweet.text.should match(latest_tweet_text)
      end
    end

  end
end
