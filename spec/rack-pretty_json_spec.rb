require "spec_helper"

describe "Rack::PrettyJson" do
  include Rack::Test::Methods

  let(:app) { app, options = Rack::Builder.parse_file File.expand_path("./support/pretty_json.ru", File.dirname(__FILE__)) ; app }
  let(:options) { app, options = Rack::Builder.parse_file File.expand_path("./support/pretty_json.ru", File.dirname(__FILE__)) ; options }

  context "when run with the default configuration options" do
    it "works" do
      get "/"
      last_response.should be_ok
    end
  end

end
