require_relative 'helper'

SimpleCov.start do
  use_merging true
  merge_timeout 3600

  add_report(:type => SimpleCov::Configuration::ReportTypes::Author,
             :sub_types => [
               SimpleCov::Configuration::ReportTypes::Author::AuthorStats
             ]
  )
end

# Execute code to get coverage
COVERAGE = "cover"
require_relative "fixtures/author_report/author_stats_file1"
require_relative "fixtures/author_report/author_stats_file2"


class TestAuthorStatsReport < Test::Unit::TestCase
  context "author report" do
    context "/author stats report" do
      setup do
        @result = SimpleCov.result.format!
        @author_reports = @result.reports[0][:sub_reports]
      end

      should "exist" do
        assert_equal 1, @author_reports.count, "best author report should be the only report"
      end

      should "have all authors" do
        authors = @author_reports[0][:items].keys
        expected_authors = ["AuthorTesterOne", "AuthorTesterTwo", "AuthorTesterThree", "AuthorTesterFour"]
        assert_equal expected_authors.sort, authors.sort, "Authors should be the expected ones"
      end

      should "match files reported per author" do
        files = @author_reports[0][:items]["AuthorTesterOne"][:files].keys.map(&:filename).
          collect{ |item| item.slice(/simplecov-reports(.*)/, 1) }
        expected_files = ["/test/fixtures/author_report/author_stats_file1.rb",
                          "/test/fixtures/author_report/author_stats_file2.rb"]

        assert_equal expected_files, files,
                     "AuthorTesterOne's authored files don't match"

        files = @author_reports[0][:items]["AuthorTesterTwo"][:files].keys.map(&:filename).
          collect{ |item| item.slice(/simplecov-reports(.*)/, 1) }
        expected_files = ["/test/fixtures/author_report/author_stats_file1.rb"]

        assert_equal expected_files, files,
                     "AuthorTesterTwo's authored files don't match"

        files = @author_reports[0][:items]["AuthorTesterThree"][:files].keys.map(&:filename).
          collect{ |item| item.slice(/simplecov-reports(.*)/, 1) }
        expected_files = ["/test/fixtures/author_report/author_stats_file2.rb"]

        assert_equal expected_files, files,
                     "AuthorTesterThree's authored files don't match"

        files = @author_reports[0][:items]["AuthorTesterFour"][:files].keys.map(&:filename).
          collect{ |item| item.slice(/simplecov-reports(.*)/, 1) }
        expected_files = []

        assert_equal expected_files, files,
                     "AuthorTesterFour's authored files don't match"
      end

      should "match the coverage report per author per file" do
        author_report = @author_reports[0][:items]["AuthorTesterOne"][:files].values
        expected_author_report = [{:covered=>3, :missed=>7, :total=>10, :coverage=>30.0},
                                  {:covered=>1, :missed=>9, :total=>10, :coverage=>10.0}]
        assert_equal expected_author_report, author_report, "AuthorTesterOne's author report should match"

        author_report = @author_reports[0][:items]["AuthorTesterTwo"][:files].values
        expected_author_report = [{:covered=>1, :missed=>3, :total=>4, :coverage=>25.0}]
        assert_equal expected_author_report, author_report, "AuthorTesterTwo's author report should match"

        author_report = @author_reports[0][:items]["AuthorTesterThree"][:files].values
        expected_author_report = [{:covered=>4, :missed=>0, :total=>4, :coverage=>100.0}]
        assert_equal expected_author_report, author_report, "AuthorTesterThree's author report should match"

        author_report = @author_reports[0][:items]["AuthorTesterFour"][:files].values
        expected_author_report = []
        assert_equal expected_author_report, author_report, "AuthorTesterFour's author report should match"
      end
    end
  end # context "author report" do
end # class TestAuthorReports
