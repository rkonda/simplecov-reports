require "simplecov-html"


module SimpleCov
  module Formatter
    class HTMLFormatter
      def formatted_file_report(report)
        case report[:type][:subtype]
          when :api
          when :class
          when :method
          when :configure
        end
        title = "#{report[:type]} #{report[:type][:subtype]}"
        title_id = title.gsub(/^[^a-zA-Z]+/, '').gsub(/[^a-zA-Z0-9\-\_]/, '')
        template('file_report').result(binding)
      end

      def formatted_author_report(report)
        generated_source = ""
        report[:sub_reports].each do |sub_report|
          case sub_report[:type]
            when :best_authors
            when :author_stats
          end
          title = "#{report[:type]} #{sub_report[:type]}"
          title_id = title.gsub(/^[^a-zA-Z]+/, '').gsub(/[^a-zA-Z0-9\-\_]/, '')
          generated_source += template('author_report').result(binding)
        end
        generated_source
      end
    end

    # Add report formatters
    formatters = {
      :file_report => :formatted_file_report,
      :author_report => :formatted_author_report
    }

    HTMLFormatter.add_report_formatters(formatters)

    # Author report would like to add author information to the source file view
    HTMLFormatter::Views::SourceFile.add_line_attribute "author", lambda { |line| line.author }
    HTMLFormatter::Views::SourceFile.add_line_attribute "authored_date", lambda { |line| line.date }

    # Add the "views" directory in this gem as a path to finding erb files
    gem_root = File.expand_path(File.join(File.dirname(__FILE__), ".."))
    HTMLFormatter.erb_files.append_path(File.join(gem_root, "views"))
  end
end
