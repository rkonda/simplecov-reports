require_relative 'helper'

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
             :best_authors_count => 3)
end

# Tests the scenario where all possible reports are configured
# Tests whether all the reports are generated
#TODO (rkonda, 06/27/2013): Add more tests
class TestAllReports < Test::Unit::TestCase
  context "tests: " do
    setup do
      @result = SimpleCov.result.format!
    end

    context "reports" do
      should "be of the expected number" do
        assert_equal 5, @result.reports.count, "There should be 5 reports"
      end
    end
  end # context "tests: " do

end
