# Rack::PrettyJson

Make your json responses PRETTY!

## Installation

Add this line to your application's Gemfile:

    gem 'rack-pretty_json', :require => 'rack/pretty_json'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-pretty_json

## Usage

Simply `require 'rack/pretty_json'` and add `Rack::PrettyJSON` to your
list of Rack middleware. `Rack::PrettyJSON` will look for any JSON
encoded responses from your application and pretty them up for you!

## Configuration

You can customize the behavior of `Rack::PrettyJSON` by passing it a
configuration hash in your rackup file or middleware configuration.

    use Rack::PrettyJSON,
      :always => false,
      :with_paramater => 'pretty'

Here's a list of the things you can tweak through the configuration
hash:

* `:always` (boolean, default: false) - if set to true, process all JSON
  responses
* `:with_paramater` (string, default: 'pretty'): When present as a key in
  a HTTP request's GET query hash, any resulting JSON responses will be
  processed.

## Notes

* Currently, `Rack::PrettyJSON` will only handle GET requests. Support
  for JSON responses resulting from HTTP POST requests is planned.
* RSpec coverage is in progress. You can find a simple test app and
  rackup file in the `spec/support` directory.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
