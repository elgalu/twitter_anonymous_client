# TwitterAnonymousClient

[![Gem Version][GV img]][Gem Version]
[![Build Status][BS img]][Build Status]
[![Dependency Status][DS img]][Dependency Status]
[![Code Climate][CC img]][Code Climate]
[![Coverage Status][CS img]][Coverage Status]

## Description

Twitter public (anonymous) client for old v1.0 API just to retrieve the last N user statuses.

## Installation

`$ gem install twitter_anonymous_client` or add to your [Gemfile][] this line: `gem 'twitter_anonymous_client'` then run [bundle install][]

## Usage

```ruby
require 'twitter_anonymous_client'

tweets = Twitter::Client.new.user_timeline('elgalu', count: 1)
elgalu = tweets.first #=>  #<Twitter::Tweet:0x00.. @id="3076....
elgalu.text #=> "Console Ruby debug is easy - Leo Gallucci's blog http://t.co/JUpUdyf5ts"
```

## Contributing

1. Fork it.
2. Make your feature addition or bug fix and create your feature branch.
3. Update the [Change Log][].
3. Add specs/tests for it. This is important so I don't break it in a future version unintentionally.
4. Commit, create a new Pull Request.
5. Check that your pull request passes the [build][travis pull requests].

## License

Released under the MIT License. See the [LICENSE][] file for further details.

## Links

[RubyGems][] | [Documentation][] | [Source][] | [Bugtracker][] | [Build Status][] | [Dependency Status][] | [Code Climate][]


[bundle install]: http://gembundler.com/man/bundle-install.1.html
[Gemfile]: http://gembundler.com/man/gemfile.5.html
[LICENSE]: LICENSE.md
[Change Log]: CHANGELOG.md

[RubyGems]: https://rubygems.org/gems/twitter_anonymous_client
[Documentation]: http://rubydoc.info/gems/twitter_anonymous_client
[Source]: https://github.com/elgalu/twitter_anonymous_client
[Bugtracker]: https://github.com/elgalu/twitter_anonymous_client/issues

[travis pull requests]: https://travis-ci.org/elgalu/twitter_anonymous_client/pull_requests

[Gem Version]: https://rubygems.org/gems/twitter_anonymous_client
[Build Status]: https://travis-ci.org/elgalu/twitter_anonymous_client
[Dependency Status]: https://gemnasium.com/elgalu/twitter_anonymous_client
[Code Climate]: https://codeclimate.com/github/elgalu/twitter_anonymous_client
[Coverage Status]: https://coveralls.io/r/elgalu/twitter_anonymous_client

[GV img]: https://badge.fury.io/rb/twitter_anonymous_client.png
[BS img]: https://travis-ci.org/elgalu/twitter_anonymous_client.png
[DS img]: https://gemnasium.com/elgalu/twitter_anonymous_client.png
[CC img]: https://codeclimate.com/github/elgalu/twitter_anonymous_client.png
[CS img]: https://coveralls.io/repos/elgalu/twitter_anonymous_client/badge.png?branch=master
