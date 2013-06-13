require "simplecov-html"

GEM_ROOT = File.expand_path(File.join(File.dirname(__FILE__), ".."))

include SimpleCov::Formatter

class SimpleCov::Formatter::HTMLFormatter
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

formatters = {
  :file_report => :formatted_file_report,
  :author_report => :formatted_author_report
}

HTMLFormatter.add_report_formatters(formatters)

HTMLFormatter.erb_files.append_path(File.join(GEM_ROOT, "views"))
