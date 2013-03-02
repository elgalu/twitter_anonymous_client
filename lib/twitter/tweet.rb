require 'strongly_typed'

require 'date'

module Twitter
  # @note Inspired from gems\twitter-4.5.0\lib\twitter\api\timelines.rb
  class Tweet
    # Class Methods
    class << self
      # Transform json array into a collection of tweets
      def build_tweets(ary)
        tweets = ary.map do |tweet|
          args = { id:         tweet['id'],
                   text:       tweet['text'],
                   created_at: tweet['created_at'] }
          Tweet.new(args)
        end
      end
    end

    # Instance Methods
    include StronglyTyped::Model

    attribute :id, String
    attribute :text, String
    attribute :created_at, DateTime
  end
end
