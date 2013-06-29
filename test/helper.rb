require 'bundler/setup'
require 'test/unit'
require 'shoulda'
require 'simplecov'
require "simplecov/reports"
require 'simplecov-html-extended'

SimpleCov.coverage_dir('tmp/coverage')

class SimpleCov::Formatter::MergedFormatter
  def format(result)
    SimpleCov::Formatter::HTMLFormatter.new.format(result)
  end
end

SimpleCov.formatter = SimpleCov::Formatter::MergedFormatter



