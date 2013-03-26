# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rack/pretty_json/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Damien Wilson"]
  gem.email         = ["damien@mindglob.com"]
  gem.description   = %q{Pretty JSON for pretty people}
  gem.summary       = %q{Rack::PrettyJSON reformats JSON responses for easier readability.}
  gem.homepage      = "https://www.github.com/damien/rack-pretty_json/"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rack-pretty_json"
  gem.require_paths = ["lib"]
  gem.version       = Rack::PrettyJson::VERSION

  gem.add_dependency "rack", "~> 1.5.2"
  gem.add_dependency "multi_json", "~> 1.7.2"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "yard"
  gem.add_development_dependency "redcarpet"
end
