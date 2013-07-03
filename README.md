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
  
    `require "simplecov/reports"`

* specify reports you would like to generate, eg.,

```ruby
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
```

### Author reports configuration

The following options can be passed to the Author report as seen in the example above.

* `:best-authors-count` :   The minimum number of authors to show in the best authors list as long as their coverage satisfies `best-author-cutoff` (default: 3).
* `:best-author-tolerance` :   Percentage value that limits how authors are selected to show in best authors list. Given m, the most number of lines written by any author, this value v, is the percentage of m, that is a normal cutoff for choosing the best authors. All the authors that have written `v/100 * m` or more lines of code are selected (default: 50.0)  
* `:best-author-cutoff` :   Percentage value that limits how authors are selected to show in best authors list. Given m, the most number of lines written by any author, this value v, is the percentage of m, that is the absolute cutoff for choosing the best authors. All the authors that have written `v/100 * m` or more lines of code are selected, unless the 'best_author_count' is reached (default: 15.0)  
* `:author-report-from` :   Starting date from which authoring is considered, for author stats reports. Format: YYYY-MM-DD HH:MM:SS (-/+)HHMM (default: 1900-12-31 00:00:00 -0000)  
* `:author-report-to` :   Ending date to which authoring is considered, for author stats reports. Format: YYYY-MM-DD HH:MM:SS (-/+)HHMM (default: 2025-12-31 00:00:00 -0000)  

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
