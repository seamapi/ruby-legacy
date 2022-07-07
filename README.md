# Seam API Ruby Gem

The Seam Ruby library provides convenient access to the Seam API from applications written
in the Ruby language. It includes a pre-defined set of classes for API resources that
initialize themselves dynamically from API responses.

This library also includes:

- [All Seam Web API Methods](https://docs.seam.co/latest/api-endpoints/overview)
- Simplified asynchronous flows, including listening for events or actions to finish

## Installation

Add the following line to your Gemfile

    gem "seamapi"

Then execute

    $ bundle

## Usage

> To use this sdk, you'll need to generate an API Key on the [Seam Dashboard](https://dashboard.getseam.com)

```ruby
seam = Seam::Client.new(api_key: "MY_API_KEY")

devices = seam.devices.list

my_door = devices.first

seam.locks.unlock(my_door).wait_until_finished

```

## Development

To play around with this module interactively in development, first run `bundle`
then run `bin/console` to get an interactive console. You can then use a sandbox
API key to play with the any new features you're testing!
