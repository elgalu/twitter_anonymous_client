require 'strongly_typed'

require 'date'

module Twitter
  # @note Inspired from twitter-4.5.0/lib/twitter/api/timelines.rb
  class Tweet
    # Class Methods
    class << self
      # Transform a json array into a collection of tweets
      #
      # @param [Array<Hash>] ary the json twitter results turned into an array of hashes
      #
      # @return [Array<Tweet>] the array of Tweets normalized objects
      #
      # @example
      #   ary = [{'created_at'=>'2013-02-28', 'id'=>3, 'text'=>'hello world'}]
      #   Twitter::Tweet.build_tweets(ary)
      #   #=> [#<Twitter::Tweet:0x07.. @id="3", @text="hello world", @created_at=#<DateTime: 2013-02-27>>]
      def build_tweets(ary)
        tweets = ary.map do |tweet|
          args = { id:          tweet['id'],
                   text:        tweet['text'],
                   created_at:  tweet['created_at'],
                   screen_name: tweet['user']['screen_name'] }
          new(args)
        end
      end
    end

    # Instance Methods
    include StronglyTyped::Model

    attribute :id, String
    attribute :text, String
    attribute :created_at, DateTime
    attribute :screen_name, String

    def status_url
      "https://twitter.com/#{screen_name}/status/#{id}"
    end
  end
end
