require 'twitter/api/timelines'

require 'net/http'
require 'uri'

module Twitter
  # @note Inspired from gems\twitter-4.5.0\spec\twitter\tweet_spec.rb
  class Client
    include Twitter::API::Timelines

    # Perform an HTTP GET request
    def get(url, query='')
      Net::HTTP.get(URI.parse("#{url}?#{query}"))
    end
  end
end
