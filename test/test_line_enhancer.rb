require_relative 'helper'

SimpleCov.start do
  use_merging true
  merge_timeout 3600
end

# Execute code to get coverage
COVERAGE = "cover"
require_relative "fixtures/line enhancer/line_enhancer_fixture"


class TestLineEnhancer < Test::Unit::TestCase
  context "line enhancers" do
    setup do
      @result = SimpleCov.result.format!
    end

    should "have enhanced line attributes" do
      author = @result.files[0].lines[0].author
      date = @result.files[0].lines[0].date
      assert_equal ["Rajesh Konda", "2013-06-28 20:53:45 -0700"], [author, date.to_s],
                   "author and date attributes of the line should match"
    end
  end
end # class TestAuthorReports
