require_relative 'helper'

# Tests the scenario where all possible reports are configured
# Tests whether all the reports are generated
#TODO (rkonda, 06/27/2013): Add tests
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
