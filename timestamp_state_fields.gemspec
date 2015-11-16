$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "timestamp_state_fields/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "timestamp_state_fields"
  s.version     = TimestampStateFields::VERSION
  s.authors     = ["Zohreh Jabbari"]
  s.email       = ["zjabbari@venturemedia.com"]
  s.homepage    = "https://github.com/zohrehj/timestamp_state_fields"
  s.summary     = "Treat timestamp columns as state fields"
  s.description = "Implements ActiveRecord state fields based on timestamp columns"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
end
