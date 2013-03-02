require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start

require 'twitter_anonymous_client'
require 'webmock/rspec'

# Require this file using `require "spec_helper"` within each of your specs
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies.
  config.order = 'random'
end

def fixture(file)
  fixtures_path = File.expand_path(File.join('..', 'fixtures'), __FILE__)
  File.new(File.join(fixtures_path, file))
end
