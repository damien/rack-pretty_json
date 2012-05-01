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
encoded responses from your application and pipe them through the YAJL
JSON parser to respond with nicely formatted JSON text.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
