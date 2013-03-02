require 'twitter/tweet'

require 'json'

module Twitter
  module API
    # @note Inspired from gems\twitter-4.5.0\spec\twitter\api\timelines_spec.rb
    module Timelines

      # Get some user timeline by screen name
      #
      # @example
      #   user_timeline('DolarBlue', count: 1)
      #
      def user_timeline(screen_name, opts)
        # Sanitize arguments
        count = opts[:count] || 1
        screen_name = screen_name.to_s
        # Work out
        result = get_user_timeline_result(screen_name, count)
        Twitter::Tweet.build_tweets parse(result)
      end

      private

      def get_user_timeline_result(screen_name, count)
        url = "http://api.twitter.com/1/statuses/user_timeline.json"
        query = "include_entities=true&include_rts=true&screen_name=#{screen_name}&count=#{count}"
        get(url, query)
      end

      def parse(result)
        JSON.parse(result)
      end

    end
  end
end
