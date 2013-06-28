require_relative 'helper'

# Execute code to get coverage

require_relative "fixtures/file_report/classes_covered"
require_relative "fixtures/file_report/classes_not_covered"
require_relative "fixtures/file_report/classes_partially_covered"
require_relative "fixtures/file_report/methods_covered"
require_relative "fixtures/file_report/methods_not_covered"
require_relative "fixtures/file_report/methods_partially_covered"

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


# Tests file reports, namely
#   classes missing coverage
#   methods missing coverage
#   sinatra api missing coverage
#   sinatra configure methods missing coverage
class TestFileReports < Test::Unit::TestCase
  context "tests: " do
    setup do
      @result = SimpleCov.result.format!
    end

    context "classes coverage" do
      should "be reported as appropriate" do
        index = 1
        assert_equal :file_report, @result.reports[index][:type][:main], "The first report is a 'file report'"
        assert_equal :class, @result.reports[index][:type][:subtype],
                     "The first report is the 'classes missing coverage'"

        class_coverage_report = @result.reports[index][:items]

        ## files
        files_in_report = class_coverage_report.keys.map(&:filename).
                            collect{ |item| item.slice(/simplecov-reports(.*)/, 1) }

        expected_files_in_report = [
          "/test/fixtures/file_report/classes_covered.rb",
          "/test/fixtures/file_report/classes_not_covered.rb"
        ]

        assert_equal expected_files_in_report, files_in_report,
                     "CCR: The file list doesn't match the expected set"

        ## classes
        non_covered_classes = [["class NonCoveredClass"],
                               ["class NonCoveredClass_Empty_None",
                                "class NonCoveredClass_Empty_BlankLine",
                                "class NonCoveredClass_Empty_Comments",
                                "class NonCoveredClass_Code",
                                "class NonCoveredClass_Comment_Code",
                                "class NonCoveredClass_BlankLine_Code"]]

        assert_equal non_covered_classes,
                     class_coverage_report.values.collect{ |item| item.map(&:src).map(&:strip) },
                     "CCR: The non-covered classes don't match the expected set"
      end
    end

    context "methods coverage" do
      should "be reported as appropriate" do
        index = 2
        assert_equal :file_report, @result.reports[index][:type][:main], "The second report is a 'file report'"
        assert_equal :method, @result.reports[index][:type][:subtype],
                     "The second report is the 'methods missing coverage'"

        method_coverage_report = @result.reports[index][:items]

        ## files
        files_in_report = method_coverage_report.keys.map(&:filename).
                            collect{ |item| item.slice(/simplecov-reports(.*)/, 1) }

        expected_files_in_report = ["/test/fixtures/file_report/classes_covered.rb",
                                    "/test/fixtures/file_report/classes_not_covered.rb",
                                    "/test/fixtures/file_report/classes_partially_covered.rb",
                                    "/test/fixtures/file_report/methods_covered.rb",
                                    "/test/fixtures/file_report/methods_not_covered.rb"]

        assert_equal expected_files_in_report, files_in_report,
                     "MCR: The file list doesn't match the expected set"

        ## Methods
        non_covered_methods = [["def non_covered_method"],
                               ["def nonCoveredClass_Code_method",
                                "def nonCoveredClass_Comment_Code_method",
                                "def nonCoveredClass_BlankLine_Code_method"],
                               ["def non_covered_method"],
                               ["def non_covered_method"],
                               ["def emptyMethod",
                                "def emptyMethod_BlankLine",
                                "def emptyMethod_Comments",
                                "def method_Code",
                                "def method_Comment_Code",
                                "def method_BlankLine_Code"]]

        assert_equal non_covered_methods,
                     method_coverage_report.values.collect{ |item| item.map(&:src).map(&:strip) },
                     "MCR: The non-covered methods don't match the expected set"

      end
    end

    #TODO (rkonda, 06/27/2013): Add tests
    context "sinatra api method regex" do
      should "match as expected" do
      end
    end

    #TODO (rkonda, 06/27/2013): Add tests
    context "sinatra configure method coverage" do
      should "match as expected" do
      end
    end

  end # context "tests: " do

end # class TestFileReports

