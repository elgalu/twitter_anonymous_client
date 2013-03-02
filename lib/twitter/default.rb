module Twitter
  module Default
    unless defined? Twitter::Default::ENDPOINT
      ENDPOINT = 'http://api.twitter.com'
      API_VERSION = '1'
    end
  end
end
