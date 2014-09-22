# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/siren/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-siren"
  spec.version       = RSpec::Siren::VERSION
  spec.authors       = ["Neer Friedman"]
  spec.email         = ["neerfri@gmail.com"]
  spec.description   = %q{RSpec for siren hypermedia}
  spec.summary       = %q{A collection of matchers and helpers for easy testing of siren objects via RSpec}
  spec.homepage      = "https://github.com/neerfri/rspec-siren"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
