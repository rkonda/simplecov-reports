# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simplecov/reports/version'

Gem::Specification.new do |spec|
  spec.name          = "simplecov-reports"
  spec.version       = Simplecov::Reports::VERSION
  spec.authors       = ["Rajesh Konda"]
  spec.email         = ["rkonda@ooyala.com"]
  spec.description   = "Contains code that enhances simplecov, and simplecov-html gems with FileReport and AuthorReport"
  spec.summary       = "Reports added to simplecov and simplecov-html: FileReport and AuthorReport"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry-nav"
  spec.add_development_dependency "shoulda"

  spec.add_dependency "ooyala-grit"
  spec.add_dependency "simplecov", "0.9.2.ooyala"
  spec.add_dependency "simplecov-html", "0.7.5.ooyala"
end
