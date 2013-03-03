require 'support/spec_helper'

describe TwitterAnonymousClient do
  it 'should have a version number' do
    TwitterAnonymousClient::VERSION.should_not be_nil
  end

  it 'should not work with another twitter client gem' do
    class Object
      module Twitter; end
    end
    expect { load 'twitter_anonymous_client' }.to raise_error
  end
end
