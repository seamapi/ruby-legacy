# Seam API Ruby Gem

## Installation

Add the following line to your Gemfile

    gem "seamapi"

Then execute

    $ bundle

## Usage


```ruby
# Configure Api Key
Seamapi.configure do |config|
  config.api_key = "API_KEY"
end


devices = Seamapi::Device.list
```
