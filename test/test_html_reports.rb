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

class TestHtmlReports < Test::Unit::TestCase
  context "html coverage file" do
    setup do
      @result = SimpleCov.result.format!
    end

    should "have all the reports" do
      file = IO.read("tmp/coverage/index.html")

      classes_report_present = file =~ /<span class=\"group_name\" style=\"color:#9a3221\">Classes missing coverage<\/span>/
      methods_report_present = file =~ /<span class=\"group_name\" style=\"color:#9a3221\">Methods missing coverage<\/span>/
      api_report_present = file =~ /<span class=\"group_name\" style=\"color:#9a3221\">API methods missing coverage<\/span>/
      configure_report_present = file =~ /<span class=\"group_name\" style=\"color:#9a3221\">Configure methods missing coverage<\/span>/
      best_author_report_present = file =~ /<span class=\"group_name\" style=\"color:#9a3221\">Best Authors<\/span>/
      author_stats_report_present = file =~ /<span class=\"group_name\" style=\"color:#9a3221\">Author Stats<\/span>/

      assert classes_report_present, "Classes report absent"
      assert methods_report_present, "Methods report absent"
      assert api_report_present, "API methods report absent"
      assert configure_report_present, "Configure report absent"
      assert best_author_report_present, "Best Author report absent"
      assert author_stats_report_present, "Author Stats report absent"
    end
  end
end
