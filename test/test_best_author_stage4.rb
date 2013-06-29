require_relative 'helper'

SimpleCov.start do
  use_merging true
  merge_timeout 3600

  add_report(:type => SimpleCov::Configuration::ReportTypes::Author,
             :sub_types => [
               SimpleCov::Configuration::ReportTypes::Author::BestAuthor
             ],
             :best_authors_count => 4)
end

# Execute code to get coverage
COVERAGE = "cover"
require_relative "fixtures/author_report/best_author_tolerance"

# best_author_tolerance is 50%
# best_author_cutoff is 15%
# best_author_count is 3
# Author: Rajesh Konda has 10% coverage with 100 lines of code
# Author: AuthorTesterOne has 20% coverage with 70 lines of code
# Author: AuthorTesterTwo has 30% coverage with 30 lines of code
# Author: AuthorTesterThree has 40% coverage with 30 lines of code
# Author: AuthorTesterFour has 50% coverage with 10 lines of code


class TestBestAuthorReport < Test::Unit::TestCase
  context "author report" do
    context "/best author report" do
      setup do
        @result = SimpleCov.result.format!
        @author_reports = @result.reports[0][:sub_reports]
      end

      context " when :best_authors_count=4" do
        should "exist" do
          assert_equal 1, @author_reports.count, "best author report should be the only report"
        end

        should "have authors in right order" do
          authors = @author_reports[0][:items].keys
          expected_authors = ["AuthorTesterThree", "AuthorTesterTwo", "AuthorTesterOne", "Rajesh Konda"]
          assert_equal expected_authors, authors, "Authors should be the expected ones"
        end

        should "match files reported per author" do
          files = @author_reports[0][:items]["Rajesh Konda"][:files].keys.map(&:filename).
                    collect{ |item| item.slice(/simplecov-reports(.*)/, 1) }
          expected_files = ["/test/fixtures/author_report/best_author_tolerance.rb"]

          assert_equal expected_files, files,
                       "Rajesh Konda's authored files don't match"

          files = @author_reports[0][:items]["AuthorTesterOne"][:files].keys.map(&:filename).
            collect{ |item| item.slice(/simplecov-reports(.*)/, 1) }
          expected_files = ["/test/fixtures/author_report/best_author_tolerance.rb"]

          assert_equal expected_files, files,
                       "AuthorTesterOne's authored files don't match"

          files = @author_reports[0][:items]["AuthorTesterTwo"][:files].keys.map(&:filename).
            collect{ |item| item.slice(/simplecov-reports(.*)/, 1) }
          expected_files = ["/test/fixtures/author_report/best_author_tolerance.rb"]

          assert_equal expected_files, files,
                       "AuthorTesterTwo's authored files don't match"

          files = @author_reports[0][:items]["AuthorTesterThree"][:files].keys.map(&:filename).
            collect{ |item| item.slice(/simplecov-reports(.*)/, 1) }
          expected_files = ["/test/fixtures/author_report/best_author_tolerance.rb"]

          assert_equal expected_files, files,
                       "AuthorTesterThree's authored files don't match"
        end

        should "match the coverage report per author per file" do
          author_report = @author_reports[0][:items]["Rajesh Konda"][:files].values
          expected_author_report = [{:covered=>10, :missed=>90, :total=>100, :coverage=>10.0}]
          assert_equal expected_author_report, author_report, "Rajesh Konda's author report should match"

          author_report = @author_reports[0][:items]["AuthorTesterOne"][:files].values
          expected_author_report = [{:covered=>14, :missed=>56, :total=>70, :coverage=>20.0}]
          assert_equal expected_author_report, author_report, "AuthorTesterOne's author report should match"

          author_report = @author_reports[0][:items]["AuthorTesterTwo"][:files].values
          expected_author_report = [{:covered=>9, :missed=>21, :total=>30, :coverage=>30.0}]
          assert_equal expected_author_report, author_report, "AuthorTesterTwo's author report should match"

          author_report = @author_reports[0][:items]["AuthorTesterThree"][:files].values
          expected_author_report = [{:covered=>12, :missed=>18, :total=>30, :coverage=>40.0}]
          assert_equal expected_author_report, author_report, "AuthorTesterThree's author report should match"
        end
      end
    end # context "/best author report" do
  end # context "author report" do
end # class TestAuthorReports
