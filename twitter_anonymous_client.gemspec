lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'twitter_anonymous_client/version'

Gem::Specification.new do |spec|

  spec.platform      = Gem::Platform::RUBY
  spec.name          = "twitter_anonymous_client"
  spec.version       = TwitterAnonymousClient::VERSION
  spec.summary       = %q{Twitter public (anonymous) client for old v1.0 API}
  spec.description   = spec.summary

  spec.required_ruby_version     = '>= 1.9.2'
  spec.required_rubygems_version = '>= 2'

  spec.license       = 'MIT'

  spec.authors       = ["Leo Gallucci"]
  spec.email         = ["elgalu3@gmail.com"]
  spec.homepage      = "https://github.com/elgalu/twitter_anonymous_client"

  spec.require_paths = ["lib"]
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})

  spec.add_runtime_dependency "strongly_typed"

  spec.add_development_dependency "bundler", ">= 1.2"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.13"
  spec.add_development_dependency "redcarpet", ">= 2.2"
  spec.add_development_dependency "yard", ">= 0.8.5.2"
  spec.add_development_dependency "simplecov", ">= 0.7.1"
  spec.add_development_dependency 'coveralls', '>= 0.5.8'
  spec.add_development_dependency 'webmock', '>= 1.11'

end
