require 'spec_helper'

require 'twitter_anonymous_client'

describe Twitter::Client, 'user_timeline' do

  let(:client) { Twitter::Client.new }
  let(:tweets) { client.user_timeline('DolarBlue', count: 1) }
  let(:first_tweet) { tweets.first }

  describe 'tweets' do
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
  end

end
