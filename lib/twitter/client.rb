require 'twitter/default'
require 'twitter/api/timelines'

require 'net/http'
require 'uri'
require 'json'

module Twitter
  # @note Inspired from gems\twitter-4.5.0\spec\twitter\tweet_spec.rb
  class Client
    include Twitter::API::Timelines

    # Perform an HTTP GET request
    # qry = [['slug', 'élgalu'], ['age', '31']]
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

    def build_uri(path, qry=[])
      query = URI.encode_www_form(qry)
      path.chomp!('/')
      path.sub!(/^\//, '')
      base = Twitter::Default::ENDPOINT
      ver  = Twitter::Default::API_VERSION
      URI.parse("#{base}/#{ver}/#{path}?#{query}")
    end

    def pute(uri, msg)
      STDERR.puts msg
      STDERR.puts "Request: #{uri.to_s}"
      exit 1
    end
  end
end
