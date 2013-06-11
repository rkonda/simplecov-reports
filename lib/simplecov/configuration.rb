#
# Enhancements to SimpleCov::Configuration for generating reports
#
module SimpleCov::Configuration

  module ReportTypes
    module ItemsMissingCoverage
      module Api
        def self.get_specification(options)
          { :type => :file_report,
            :options => {
              :report_type => :api
            }
          }
        end
      end

      module Class
        def self.get_specification(options)
          { :type => :file_report,
            :options => {
              :report_type => :class
            }
          }
        end
      end

      module Method
        def self.get_specification(options)
          { :type => :file_report,
            :options => {
              :report_type => :method
            }
          }
        end
      end

      module Configure
        def self.get_specification(options)
          { :type => :file_report,
            :options => {
              :report_type => :configure
            }
          }
        end
      end
    end # module ItemsMissingCoverage

    module Author
      def self.get_specification(options)
        specification =
        { :type => :author_report,
          :options => {
            :report_types => {},
            :best_authors_count => options.has_key?(:best_authors_count) ? options[:best_authors_count]
            : 3,
            :best_author_tolerance => options.has_key?(:best_author_tolerance) ? options[:best_author_tolerance]
            : 50.00,
            :best_author_cutoff => options.has_key?(:best_author_cutoff) ? options[:best_author_cutoff]
            : 15.00,
            :author_report_from => options.has_key?(:author_report_from) ? options[:author_report_from]
            : "1900-12-31 00:00:00 -0000",
            :author_report_to => options.has_key?(:author_report_to) ? options[:author_report_to]
            : "2025-12-31 00:00:00 -0000"
          }
        }

        options[:sub_types].each do |author_type|
          specification = author_type.get_specification(options, specification)
        end
        specification
      end

      module BestAuthor
        def self.get_specification(options, specification)
          specification[:options][:report_types][:best_authors] = true
          specification
        end
      end

      module AuthorStats
        def self.get_specification(options, specification)
          specification[:options][:report_types][:author_stats] = true
          specification
        end
      end
    end # module Author

  end # module ReportTypes

end # module SimpleCov::Configuration

