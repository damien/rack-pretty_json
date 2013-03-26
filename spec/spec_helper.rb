$LOAD_PATH.unshift File.expand_path("../lib", File.dirname(__FILE__))
require "rack/test"

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
end
