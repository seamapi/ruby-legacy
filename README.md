# Seam API Ruby Gem

The Seam Ruby library provides convenient access to the Seam API from applications written
in the Ruby language. It includes a pre-defined set of classes for API resources that
initialize themselves dynamically from API responses.

This library also includes:
* [All Seam Web API Methods](https://docs.seam.co/latest/api-endpoints/overview)
* Simplified asynchronous flows, including listening for events or actions to finish

## Installation

Add the following line to your Gemfile

    gem "seamapi"

Then execute

    $ bundle

## Usage


```ruby
# Configure Api Key
Seam.configure do |config|
  config.api_key = "API_KEY"
end


devices = Seamapi::Device.list
```
