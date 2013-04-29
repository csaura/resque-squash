# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'resque/squash/version'

Gem::Specification.new do |spec|
  spec.name          = "resque-squash"
  spec.version       = Resque::Squash::VERSION
  spec.authors       = ["Carlos Saura"]
  spec.email         = ["saurastar@gmail.com"]
  spec.description   = %q{A Resque failure backend for http://squash.io}
  spec.summary       = %q{resque-squash provides a Resque failure backend that sends exceptions raised by jobs to http://squash.io}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency('resque', '>= 1.8.0')
  spec.add_dependency('squash_ruby', '>= 1.1.1')
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
