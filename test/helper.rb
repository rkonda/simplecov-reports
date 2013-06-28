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

def start_simplecov
  SimpleCov.formatter = SimpleCov::Formatter::MergedFormatter

  SimpleCov.start do
    use_merging true
    merge_timeout 3600

    add_report :type => SimpleCov::Configuration::ReportTypes::ItemsMissingCoverage::Api
    add_report :type => SimpleCov::Configuration::ReportTypes::ItemsMissingCoverage::Class
    add_report :type => SimpleCov::Configuration::ReportTypes::ItemsMissingCoverage::Method
    add_report :type => SimpleCov::Configuration::ReportTypes::ItemsMissingCoverage::Configure
    add_report(:type => SimpleCov::Configuration::ReportTypes::Author,
               :sub_types => [
                 SimpleCov::Configuration::ReportTypes::Author::BestAuthor,
                 SimpleCov::Configuration::ReportTypes::Author::AuthorStats
               ],
               :best_authors_count => 4)
  end
end

start_simplecov



