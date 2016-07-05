<img src="http://d324imu86q1bqn.cloudfront.net/uploads/user/avatar/641/large_Ello.1000x1000.png" width="200px" height="200px" />

# Sightengine API Ruby Wrapper

This gem provides a ruby API to the [Sightengine image moderation service](https://sightengine.com/).

[![Build Status](https://travis-ci.org/ello/sightengine-ruby.svg?branch=master)](https://travis-ci.org/ello/sightengine-ruby)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sightengine-ruby', github: 'ello/sightengine-ruby', require: 'sightengine'
```

And then execute:

    $ bundle


## Usage

Before making any calls, you'll need to set your credentials using the `SIGHTENGINE_API_USER` and `SIGHTENGINE_API_SECRET` environment variables.

The Sightengine API has one call - `moderate`, which [checks an image for nudity](https://sightengine.readme.io/docs/nudityjson) and returns an evaluation of it.

```ruby
  puts Sightengine.moderate('https://unsplash.it/200/300?random')
  #<struct Sightengine::Response status="success", nudity_result=false, nudity_confidence=66>
```

## Development

After checking out the repo, run `rake` to run the tests. 

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

If you're adding new calls to Sightengine, running tests may require a valid API user ID and secret as described above. Normal test runs are stubbed via VCR, and should not require credentials.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ello/sightengine-ruby.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


## Code of Conduct
Ello was created by idealists who believe that the essential nature of all human beings is to be kind, considerate, helpful, intelligent, responsible, and respectful of others. To that end, we will be enforcing [the Ello rules](https://ello.co/wtf/policies/rules/) within all of our open source projects. If you don’t follow the rules, you risk being ignored, banned, or reported for abuse.
