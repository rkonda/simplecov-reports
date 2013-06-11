# Simplecov::Reports

This gem provides author and file analysis based reports to be generated when simplecov generates code
coverage reports.

Author reports include 'best author' and 'author stats'. File analysis based reports include 'api', 'class',
'method' and 'configure' coverage reports.

'api' coverage report gives statistics about the api methods (as specified using Sinatra) that are missing
coverage. 'class' coverage report gives statistics about the classes that are missing coverage. 'method'
coverage report gives statistics about all the methods/functions that are missing coverage. 'configure'
coverage report gives statistics about all the 'configure' blocks (as specified using Sinatra) that are
missing coverage.

## Installation

Add this line to your application's Gemfile:

    gem 'simplecov-reports'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simplecov-reports

## Usage

* require the gem in your .simplecov file
  require "simplecov/reports"

* specify reports you would like to generate, eg.,

    add_report :type => SimpleCov::Configuration::ReportTypes::ItemsMissingCoverage::Api
    add_report :type => SimpleCov::Configuration::ReportTypes::ItemsMissingCoverage::Class
    add_report :type => SimpleCov::Configuration::ReportTypes::ItemsMissingCoverage::Method
    add_report :type => SimpleCov::Configuration::ReportTypes::ItemsMissingCoverage::Configure
    add_report(:type => SimpleCov::Configuration::ReportTypes::Author,
               :sub_types => [
                 SimpleCov::Configuration::ReportTypes::Author::BestAuthor,
                 SimpleCov::Configuration::ReportTypes::Author::AuthorStats
               ],
               :best_authors_count => 4)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
