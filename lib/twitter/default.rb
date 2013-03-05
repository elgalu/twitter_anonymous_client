module Twitter
  module Default
    unless defined? Twitter::Default::ENDPOINT
      ENDPOINT = 'http://api.twitter.com'
      API_VERSION = '1'
    end

    class << self
      # @note This is configurable in case you want to use a Twitter-compatible endpoint.
      # @see https://github.com/sferik/twitter/blob/01e2781e4a78137ca4e5e6d3e4faf2552ee9ec76/lib/twitter/default.rb#L78
      # @return [String]
      def endpoint
        ENDPOINT
      end

      # @note Should be stuck with no-oauth twitter versions (public API)
      # @return [String]
      def api_version
        API_VERSION
      end
    end
  end
end
