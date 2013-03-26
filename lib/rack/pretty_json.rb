require "stringio"
require "multi_json"
require "rack"
require "rack/pretty_json/version"

module Rack

  class PrettyJSON

    # You can customize the behavior of `Rack::PrettyJSON` with the options hash.
    # @param [#call] app A Rack middleware or endpoint
    # @param [Hash<Symbol => Boolean, String>] options a configuration hash
    def initialize(app, options = {})
      @app = app
      @options = {
        :always => false,
        :with_paramater => 'pretty'
      }.merge(options)
    end

    def call(env)
      status, headers, body = @app.call(env)
      headers = Rack::Utils::HeaderHash.new(headers)
      query_hash = Rack::Utils.parse_nested_query(env['QUERY_STRING'])

      # If this is a JSON response..
      if headers['Content-Type'].to_s.scan('application/json').size > 0
        # AND if ANY of the following are true:
        # - we've been configured to process all JSON responses
        # - pretty json format has been requested
        # - we're in development mode
        if always_process? || requsted_pretty_version?(query_hash) || development?
          body_io = ::StringIO.new
          body.each { |line| body_io << line }

          body = ::StringIO.new make_pretty!(body_io.string)
        end
      end

      [status, headers, body]
    end

    private
    # True if `Rack::PrettyJSON` has been configured to process all JSON responses.
    # @return Boolean
    def always_process?
      @options[:always]
    end

    # True if our configured request paramater is present in the GET query string
    # @param [Hash] query_hash a Hash representation of the request GET paramaters
    # @return Boolean
    def requsted_pretty_version?(query_hash)
      query_hash.has_key?(@options[:with_paramater])
    end

    # True if RACK_ENV is set to 'development'
    # @return Boolean
    def development?
      ENV['RACK_ENV'] == 'development'
    end

    # Takes a JSON string and uses it to generated a nicely formated version of it.
    # @param [String] body a valid JSON string
    # @return #each
    def make_pretty!(body)
      data = MultiJson.load(body)
      MultiJson.dump(data, :pretty => true)
    end

  end

end
