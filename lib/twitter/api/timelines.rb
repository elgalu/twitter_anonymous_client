require 'twitter/default'
require 'twitter/tweet'

module Twitter
  module API
    # @note Inspired from twitter-4.5.0/spec/twitter/api/timelines_spec.rb
    module Timelines

      # Get some user timeline by screen name (last statuses)
      #
      # @param [String] screen_name the twitter user slug
      # @param [Hash] opts the options to retrieve the statuses
      # @option opts [Integer] :count The number of statuses to retrieve
      #
      # @return [Array<Tweet>] the tweets collection array
      #
      # @example
      #   Twitter::Client.new.user_timeline('DolarBlue', count: 1)
      #   #=> [#<Twitter::Tweet:0x011.. @id="308609..., @text="Dolar Paralelo: $7,84.....
      def user_timeline(screen_name, opts)
        # Sanitize arguments
        count = opts[:count] || 1
        screen_name = screen_name.to_s
        # Work out
        results = get_user_timeline_results(screen_name, count)
        Twitter::Tweet.build_tweets(results)
      end

      # Get the last tweet given a twitter screen name (the last status)
      #
      # @param [String] screen_name the twitter user slug
      #
      # @return [Tweet] the Tweet object
      #
      # @example
      #   Twitter::Client.new.last_tweet('DolarBlue')
      #   #=> #<Twitter::Tweet:0x011.. @id="308609..., @text="Dolar Paralelo: $7,84.....
      def last_tweet(screen_name)
        tweets = user_timeline(screen_name, count: 1)
        tweets.first
      end

      private

      # (see #user_timeline)
      # @private
      def get_user_timeline_results(screen_name, count)
        path = "statuses/user_timeline.json"
        qry = []
        qry << ['screen_name', screen_name]
        qry << ['count', count.to_s]
        get(path, qry)
      end

    end
  end
end
