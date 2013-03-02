require 'twitter/default'
require 'twitter/tweet'

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
        results = get_user_timeline_results(screen_name, count)
        Twitter::Tweet.build_tweets(results)
      end

      private

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
