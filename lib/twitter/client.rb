require 'twitter/default'
require 'twitter/api/timelines'

require 'net/http'
require 'uri'
require 'json'

module Twitter
  # @note Inspired from twitter-4.5.0/spec/twitter/tweet_spec.rb
  class Client
    ConnectionError = Class.new(StandardError)

    include Twitter::API::Timelines

    # Perform an HTTP get request against Twitter API then parse the result
    #
    # @param [String] path the relative path to twitter API
    # @param [Array<Array<(String, String)>>] qry a nested array used to build the http query string
    #
    # @return [Array<Hash>] a collection of twitter response object, for example tweets
    #
    # @example
    #   path = "statuses/user_timeline.json"
    #   qry = [['screen_name', 'elgalu'], ['count', '1']]
    #   Twitter::Client.new.get(path, qry)
    #   #=> [{"created_at"=>"Fri Mar 01 21:42:19 +0000 2013", "id"=>30760....
    def get(path, qry=[])
      uri = build_uri(path, qry)
      begin
        result = Net::HTTP.get(uri)
      rescue => ex
        pute uri, "Some network connection error: #{ex.inspect}"
      end

      pute uri, "The result contains errors: #{result}" if result =~ /error/
      JSON.parse(result)
    end

    private

    # Builds an URI object out of a path and a query string appending twitter endpoint and api version
    #
    # @param (see #get)
    #
    # @return [URI] parsed ready url
    #
    # @private
    def build_uri(path, qry=[])
      query = URI.encode_www_form(qry)
      path.chomp!('/')
      path.sub!(/^\//, '')
      base = Twitter::Default.endpoint
      ver  = Twitter::Default.api_version
      URI.parse("#{base}/#{ver}/#{path}?#{query}")
    end

    # Output connection related errors and terminates execusion
    #
    # @param [URI] uri the uri from which will use the full url
    # @param [String] msg the custom error message
    #
    # @raise [ConnectionError] always, with url and message
    #
    # @private
    def pute(uri, msg)
      raise ConnectionError.new("#{msg}\nRequest: #{uri.to_s}\n")
    end
  end
end
