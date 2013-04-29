# Resque::Squash

A Resque failure backend for http://squash.io

## Installation

Add this line to your application's Gemfile:

    gem 'resque-squash'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install resque-squash

## Usage

### Example: Single Failure Backend

Using only the squash failure backend:

    require 'resque'
    require 'resque/failure/squash'

    Resque::Failure::Squash.configure do |configuration|
      configuration[:api_host]    = 'http://localhost:3001'
      configuration[:api_key]     = 'ab8cfdee131fac6989bd'
      configuration[:environment] = Rails.env
    end
    Resque::Failure.backend = Resque::Failure::Squash

### Example: Multiple Failure Backends

Using both the redis and squash failure backends:

    require 'resque'
    require 'resque/failure/squash'

    Resque::Failure::Squash.configure do |configuration|
      configuration[:api_host]    = 'http://localhost:3001'
      configuration[:api_key]     = 'ab8cfdee131fac6989bd'
      configuration[:environment] = Rails.env
    end

    Resque::Failure::MultipleWithRetrySuppression.classes = [Resque::Failure::Redis, Resque::Failure::Squash]
    Resque::Failure.backend = Resque::Failure::MultipleWithRetrySuppression

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
