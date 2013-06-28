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

require_relative "fixtures/classes_covered"
require_relative "fixtures/classes_not_covered"
require_relative "fixtures/classes_partially_covered"
require_relative "fixtures/methods_covered"
require_relative "fixtures/methods_not_covered"
require_relative "fixtures/methods_partially_covered"

# Covered classes
CoveredClass_Empty_None.new
CoveredClass_Empty_BlankLine.new
CoveredClass_Empty_Comments.new
CoveredClass_Code.new.coveredClass_Code_method
CoveredClass_BlankLine_Code.new.coveredClass_BlankLine_Code_method
CoveredClass_Comment_Code.new.coveredClass_Comment_Code_method

# Partially covered classes
PartiallyCoveredClass.new.covered_method

# Covered methods
CoveredMethod.new.emptyMethod
CoveredMethod.new.emptyMethod_BlankLine
CoveredMethod.new.emptyMethod_Comments
CoveredMethod.new.method_Code
CoveredMethod.new.method_BlankLine_Code
CoveredMethod.new.method_Comment_Code

# Non-covered methods
NonCoveredMethod.new.covered_method

# Partially covered methods
PartiallyCoveredMethod.new.partially_covered_method true



