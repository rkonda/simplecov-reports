#
# FileReport gives statistics of different types of elements based on analyzing the code in files.
# Stats are generated per file, but also summarized for the element of interest.
# The elements are for example, 'api' calls. 'class'es and 'method's.
#
require "simplecov"

module SimpleCov
  class FileReport < Report
    BLOCK_END_REGEX = /^(?<indent>\s*)end\s*$/

    attr_reader :report_type, :title, :options

    def initialize(options)
      @options = options
      @report_type = options[:report_type]
      case @report_type
        when :api
          @block_start_regex = /^(?<indent>\s*)(get|put|post|delete|patch|options|before) \"/
          @title = "API methods missing coverage"
        when :class
          @block_start_regex = /^(?<indent>\s*)(class|module) /
          @title = "Classes missing coverage"
        when :method
          @block_start_regex = /^(?<indent>\s*)(def) /
          @title = "Methods missing coverage"
        when :configure
          @block_start_regex = /^(?<indent>\s*)(configure) /
          @title = "Configure methods missing coverage"
      end
    end

    def generate(files)
      @report = {
        :type => {
          :main => :file_report,
          :subtype => @report_type
        },
        :title => @title,
        :items => ItemMap.new
      }

      files.each do |file|
        @report[:items][file] = SimpleCov::SourceFile::LineList.new

        file.lines.each_with_index do |line, line_number|
          line = file.lines[line_number]
          method_started = @block_start_regex.match(line.source)
          if method_started && line.missed?
            @report[:items][file] << line
            next
          end

          next_line = file.lines[line_number + 1]
          missed_next_line = method_started && next_line.missed?
          if method_started && missed_next_line
            @report[:items][file] << line
            next
          end

          method_ends_on_same_line = /\bend\s*$/.match(line.source)
          if method_started && method_ends_on_same_line
            # line.source += " *"
            next
          end

          next_line = file.lines[line_number + 1]
          next_line_excluded = method_started && next_line.never?
          if method_started && next_line_excluded
            method_start_line = line
            begin
              line_number += 1
              line = file.lines[line_number]
              method_ended = BLOCK_END_REGEX.match(line.source)
              method_ended = method_ended && method_started["indent"].length >= method_ended["indent"].length
              next_line_included = !line.never?
            end until method_ended || next_line_included

            missed_next_line = line.missed?
            if missed_next_line
              # line.source += " **"
              @report[:items][file] << method_start_line
            end
          end
        end # file.lines.each

        @report[:items].delete(file) if @report[:items][file].empty?
      end # result.files.each

      @report
    end # generate(files)

  end # class FileReport

end # module SimpleCov

SimpleCov::Report.register(:file_report, SimpleCov::FileReport)